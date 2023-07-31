import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Error occurred. Check internet connection',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
      ),
    );
  }
}