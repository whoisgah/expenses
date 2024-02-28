import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextfield extends StatelessWidget {
  const AdaptativeTextfield(
      {super.key,
      required this.label,
      required this.controller,
      required this.onSubmitted,
      this.keyboardType = TextInputType.text});

  final String label;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: label,
              keyboardType: keyboardType,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
        )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
            keyboardType: keyboardType,
          );
  }
}
