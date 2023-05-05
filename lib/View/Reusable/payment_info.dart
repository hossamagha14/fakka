import 'package:flutter/material.dart';

class PaymentInfo extends StatelessWidget {
  final String image;
  final String username;
  final String time;
  final Text money;
  const PaymentInfo(
      {Key? key,
      required this.image,
      required this.money,
      required this.time,
      required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              time,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w500),
            )
          ],
        ),
        const Spacer(),
        money
      ],
    );
  }
}
