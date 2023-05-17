import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final String label;
  final function;
  const SettingsButton({Key? key, required this.label, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 21),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            const SizedBox(height: 7,),
            const Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
