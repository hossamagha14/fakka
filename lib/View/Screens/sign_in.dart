import 'package:fakka/View%20Model/Log/log_in_cubit.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/my_button.dart';
import 'package:fakka/View/Reusable/my_text_field.dart';
import 'package:fakka/View/Reusable/toasts.dart';
import 'package:fakka/View/Screens/bottom_nav_bar.dart';
import 'package:fakka/View/Screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../View Model/Log/log_in_states.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignInCubit(),
        child: BlocConsumer<SignInCubit, SignInStates>(
          listener: (context, state) {
            if (state is SignInSuccessState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavBarScreen(),
                  ),
                  (route) => false);
            }else if(state is SignInFailState){
              errorToast(message: 'Please check the email and password and try again.');
            }
          },
          builder: (context, state) {
            SignInCubit myCubit = SignInCubit.get(context);
            return SafeArea(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Padding(
                  padding: horizontalPadding(context,top: 0,bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                          child: Image(
                        image: AssetImage('assets/images/fakka.png'),
                      )),
                      const SizedBox(height: 40),
                      const Text('Sign in',
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
                      const SizedBox(height: 40),
                      MyButton(
                          title: 'Sign in',
                          function: () {
                            myCubit.signIn(
                                email: emailController.text,
                                password: passwordController.text);
                          }),
                      const SizedBox(height: 20),
                      const Text('Don\'t have an account?',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 20),
                      MyButton(
                          title: 'Sign Up',
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ));
                          })
                    ],
                  ),
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
