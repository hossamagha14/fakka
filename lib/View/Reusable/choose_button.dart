import 'package:flutter/material.dart';

class ChooseButton extends StatelessWidget {
  final function;
  final double width;
  final Color color;
  final Color textColor;
  final String name;
  final IconData icon;
  const ChooseButton({Key? key,required this.function,required this.width,required this.color,required this.name,required this.icon,required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.065,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: width, color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 28,
              color: textColor,
            ),
            Text(
              name,
              style: TextStyle(color: textColor, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
