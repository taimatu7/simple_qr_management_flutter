import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Future<T> showCircularProgressIndicator<T>(Future<T> function) async {
    showDialog(
      context: this,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    final result = await function;
    Navigator.pop(this);
    return result;
  }
}
