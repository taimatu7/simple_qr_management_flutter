import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Future<void> showCircularProgressIndicator(Future<void> function) async {
    showDialog(
      context: this,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    await function;
    Navigator.pop(this);
  }
}
