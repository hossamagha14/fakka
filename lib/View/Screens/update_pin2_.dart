import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class UpdatePinScreen2 extends StatelessWidget {
  UpdatePinScreen2({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
          listener: (context, state) {
            if (state is BottomNavBarChangePinSuccessState) {
              Navigator.pop(context);
              successToast(message: 'PIN has been updated successfully');
            } else if (state is BottomNavBarChangePinFailState) {
              errorToast(
                  message: 'An error has occured please try again later.');
            }
          },
          builder: (context, state) {
            BottomNavBarCubit myCubit = BottomNavBarCubit.get(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: 'Enter your new ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300)),
                          TextSpan(
                              text: '4-digit ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700))
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 25,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: const Center(
                        child: Text(
                          'PIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Pinput(
                  separator: const SizedBox(
                    width: 25,
                  ),
                  showCursor: false,
                  onCompleted: (value) {
                    myCubit.updatePin(passwordController.text);
                  },
                  controller: passwordController,
                  obscureText: true,
                  defaultPinTheme: PinTheme(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: mainColor, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 20,
                    height: 20,
                    textStyle: TextStyle(color: mainColor),
                    decoration: BoxDecoration(
                      color: mainColor,
                      border: Border.all(color: mainColor, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
