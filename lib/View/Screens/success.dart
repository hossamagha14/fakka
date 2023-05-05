import 'package:fakka/View/Screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Reusable/colors_paddings.dart';
import '../Reusable/my_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset('assets/animation/success.json',
                  width: MediaQuery.of(context).size.width * 0.8),
              Text(
                'Account created successfully',
                style: TextStyle(
                    fontSize: 20,
                    color: mainColor,
                    fontWeight: FontWeight.w500),
              ),
              MyButton(
                  title: 'Go to Sign in',
                  function: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                        (route) => false);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
