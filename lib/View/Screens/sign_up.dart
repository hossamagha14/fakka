import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/my_button.dart';
import 'package:fakka/View/Reusable/my_text_field.dart';
import 'package:fakka/View/Screens/select_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../View Model/Sign up/sign_up_cubit.dart';
import '../../View Model/Sign up/sign_up_states.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SignUpCubit myCubit = SignUpCubit.get(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: horizontalPadding(context, top: 0, bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                        child: Image(
                      image: AssetImage('assets/images/fakka.png'),
                    )),
                    const SizedBox(height: 40),
                    const Text('Sign Up',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hint: 'Email',
                      secure: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: userNameController,
                      hint: 'User name',
                      secure: false,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: cardHolderNameController,
                      hint: 'Card holder name',
                      secure: false,
                      maxLength: 24,
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: cardPasswordController,
                      hint: 'Card PIN',
                      secure: myCubit.cardPassSecure,
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      suffixIcon: InkWell(
                        child: Icon(
                          myCubit.cardPassSecure == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: mainColor,
                        ),
                        onTap: () {
                          myCubit.showCardPassword();
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: passwordController,
                      hint: 'Password',
                      secure: myCubit.secure,
                      suffixIcon: InkWell(
                        child: Icon(
                          myCubit.secure == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: mainColor,
                        ),
                        onTap: () {
                          myCubit.showPassword();
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyTextFormField(
                      controller: confirmPasswordController,
                      hint: 'Confirm Password',
                      secure: myCubit.confirmPassSecure,
                      suffixIcon: InkWell(
                        child: Icon(
                          myCubit.confirmPassSecure == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: mainColor,
                        ),
                        onTap: () {
                          myCubit.showConfirmPassword();
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    MyButton(
                        title: 'Next',
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectImageScreen(
                                    cardPassword: cardPasswordController.text,
                                    cardHolderName:
                                        cardHolderNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    userName: userNameController.text),
                              ));
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
