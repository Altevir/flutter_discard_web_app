import 'package:flutter/material.dart';

import 'package:flutter_discard_web_app/app/pages/widgets/custom_container.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Image.asset(
            'assets/discord_notfound.png',
            width: 82,
            height: 82,
          ),
          const SizedBox(height: 10),
          const Text(
            'ID do usuário não encontrado',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
