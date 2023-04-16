import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:flutter_discard_web_app/app/pages/widgets/custom_container.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Lottie.asset(
            'assets/discord.json',
            width: 82,
            height: 82,
          ),
          const SizedBox(height: 10),
          const Text(
            'Aguarde, consultando...',
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
