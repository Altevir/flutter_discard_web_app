import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_discard_web_app/app/helpers/dialog_widget.dart';
import 'package:flutter_discard_web_app/app/pages/widgets/empty_state.dart';
import 'package:flutter_discard_web_app/app/pages/widgets/error_state.dart';
import 'package:flutter_discard_web_app/app/pages/widgets/loader.dart';
import 'package:flutter_discard_web_app/app/pages/widgets/search_by_id.dart';
import 'package:flutter_discard_web_app/app/pages/widgets/user_card.dart';
import 'package:flutter_discard_web_app/app/view_models/base_view_model.dart';
import 'package:flutter_discard_web_app/app/view_models/user_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserViewModel _viewModel;
  final _textEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _viewModel = context.read<UserViewModel>();
      },
    );
  }

  @override
  void dispose() {
    _textEditController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Center(
          child: Container(
            color: const Color(0xff5865f2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.search_rounded,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 14,
                ),
                Text(
                  'Discard',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff2c2e33),
          child: Padding(
            padding: const EdgeInsets.only(top: 94),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchById(
                  textEditController: _textEditController,
                  onTap: () {
                    if (_textEditController.text.isEmpty) {
                      showAlert(context: context, title: 'Informação', text: 'Por favor, preencha o campo com o ID do Discord!');
                      return;
                    }

                    _viewModel.getUserById(_textEditController.text);
                  },
                ),
                const SizedBox(height: 20),
                Consumer<UserViewModel>(
                  builder: (_, userViewModel, __) {
                    switch (userViewModel.status) {
                      case RequestStatus.initial:
                        return const EmptyState();
                      case RequestStatus.loading:
                        return const Loader();
                      case RequestStatus.success:
                        return UserCard(user: _viewModel.user!);
                      default:
                        return const ErrorState();
                    }
                  },
                ),
                const SizedBox(height: 50),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    child: const Text(
                      'birobirobiro.dev',
                      style: TextStyle(color: Color(0xfff1f1f1), fontSize: 16),
                    ),
                    onTap: () => _viewModel.openUrl(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
