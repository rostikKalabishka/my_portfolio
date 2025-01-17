import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/colars_const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
    this.focusNode,
    this.onChanged,
  });

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      focusNode: focusNode,
      cursorColor: AppColors.darkCard,
      style: const TextStyle(
        color: AppColors.darkBackground,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: AppColors.lightBackground,
        focusedBorder: getInputBorder,
        enabledBorder: getInputBorder,
        border: getInputBorder,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
