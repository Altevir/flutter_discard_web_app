import 'package:flutter/material.dart';

import 'package:flutter_discard_web_app/app/pages/widgets/custom_container.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Image.asset(
        'assets/discord.png',
        width: 82,
        height: 82,
        alignment: Alignment.center,
      ),
    );
  }
}
