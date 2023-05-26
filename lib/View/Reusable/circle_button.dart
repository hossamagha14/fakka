import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color ? color;
  // ignore: prefer_typing_uninitialized_variables
  final function;
  const CircleButton(
      {Key? key,
      required this.icon,
      required this.title,
      this.color,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: function,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.075,
              backgroundColor: color??mainColor,
              child: icon,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.2,
            height: MediaQuery.of(context).size.height*0.02,
            child: FittedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
