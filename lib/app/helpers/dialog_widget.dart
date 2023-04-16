import 'package:flutter/material.dart';

Future<void> showAlert({
  required BuildContext context,
  required String title,
  required String text,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff5865f2),
              ),
            ),
          )
        ],
      );
    },
  );
}
