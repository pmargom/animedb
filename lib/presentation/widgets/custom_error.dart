import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String message;
  const CustomError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text("Error: $message");
  }
}
