import 'package:flutter/material.dart';
import 'package:yoko_test_task/style/app_colors.dart';

class TextFieldCommon extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;

  const TextFieldCommon(
      {Key? key, required this.textController, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white.withOpacity(0.04),
        labelStyle: const TextStyle(color: AppColors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white.withOpacity(0.08),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white.withOpacity(0.08),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        labelText: labelText,
      ),
      controller: textController,
    );
  }
}
