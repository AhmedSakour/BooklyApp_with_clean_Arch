import 'package:flutter/material.dart';

void errorSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color.fromARGB(255, 231, 24, 9),
      content: Text(errorMessage,
          style: const TextStyle(
            color: Colors.white,
          ))));
}
