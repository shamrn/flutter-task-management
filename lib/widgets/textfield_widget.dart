import 'package:flutter/material.dart';
import 'package:task_management/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double borderRadius;
  final int? maxLines;
  final bool readOnly;

  TextFieldWidget(
      {Key? key,
      required this.textController,
      required this.hintText,
      required this.borderRadius,
      this.maxLines = 1,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
