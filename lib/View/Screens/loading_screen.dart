import 'package:fakka/View%20Model/Sign%20up/sign_up_cubit.dart';
import 'package:fakka/View%20Model/Sign%20up/sign_up_states.dart';
import 'package:fakka/View/Screens/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../Reusable/colors_paddings.dart';

class LoadingSrceen extends StatelessWidget {
  const LoadingSrceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SuccessScreen(),
                ),
                (route) => false);
          }
          else if(state is SignUpFailState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/animation/loading.json'),
              Text(
                'Creating your account...',
                style: TextStyle(
                    fontSize: 20,
                    color: mainColor,
                    fontWeight: FontWeight.w500),
              )
            ],
          );
        },
      ),
    );
  }
}
