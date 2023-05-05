import 'package:flutter/material.dart';

import 'colors_paddings.dart';

class MyButton extends StatelessWidget {
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final function;
  const MyButton({Key? key, required this.title, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(mainColor),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
          child: Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
    );
  }
}
