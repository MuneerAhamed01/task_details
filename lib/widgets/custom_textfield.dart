import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../list_screen.dart';

class CustomizedFormField extends StatelessWidget {
  const CustomizedFormField({
    Key? key,
    this.validate,
    required this.hintText,
    required this.controller, this.inputType, this.listInput,
  }) : super(key: key);
  final String? Function(String?)? validate;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? inputType;
  final List<TextInputFormatter>? listInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      inputFormatters: listInput,
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: borderDecoration(),
          focusedBorder: borderDecoration(),
          isCollapsed: false,
          isDense: false,
          contentPadding:
              const EdgeInsets.only(left: 11, right: 0, top: 14, bottom: 10),
          errorStyle: const TextStyle(fontSize: 12, height: 0.5),
          border: const OutlineInputBorder()),
      validator: validate,
    );
  }
}
