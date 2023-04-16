import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_discard_web_app/app/service/http_client.dart';
import 'package:flutter_discard_web_app/app/service/http_client_impl.dart';
import 'package:flutter_discard_web_app/app/view_models/user_view_model.dart';

class ApplicationProviderBinding extends StatelessWidget {
  const ApplicationProviderBinding({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HttpClient>(create: (context) => HttpClientImpl()),
        ChangeNotifierProvider<UserViewModel>(
          create: (context) => UserViewModel(
            httpClient: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
