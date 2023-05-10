import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool secure;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  const MyTextFormField(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.secure,
      this.keyboardType,
      this.maxLength,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          obscureText: secure,
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
              suffixIcon: suffixIcon ?? const SizedBox(),
              border: InputBorder.none,
              hintText: hint,
              counterText: '',
              hintStyle: const TextStyle(fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
