import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/my_button.dart';
import 'package:fakka/View/Reusable/my_text_field.dart';
import 'package:fakka/View/Reusable/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPassword extends StatelessWidget {
  EditPassword({Key? key}) : super(key: key);
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change password'),
      ),
      body: BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
        listener: (context, state) {
          if (state is BottomNavBarNotificationUpdateSuccessState) {
            Navigator.pop(context);
            successToast(message: 'Password changed successfully');
          }
        },
        builder: (context, state) {
          BottomNavBarCubit myCubit = BottomNavBarCubit.get(context);
          return Padding(
            padding: horizontalPadding(context, top: 0, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Change password',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextFormField(
                    suffixIcon: InkWell(
                      onTap: () => myCubit.showCardPassword(),
                      child: Icon(
                        myCubit.pass == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: mainColor,
                      ),
                    ),
                    controller: oldPasswordController,
                    hint: 'Old password',
                    secure: myCubit.pass),
                const SizedBox(
                  height: 20,
                ),
                MyTextFormField(
                    suffixIcon: InkWell(
                      onTap: () => myCubit.showCardNewPassword(),
                      child: Icon(
                        myCubit.newpass == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: mainColor,
                      ),
                    ),
                    controller: newPasswordController,
                    hint: 'new password',
                    secure: myCubit.newpass),
                const SizedBox(
                  height: 20,
                ),
                MyTextFormField(
                    suffixIcon: InkWell(
                      onTap: () => myCubit.showCardConfirmPassword(),
                      child: Icon(
                        myCubit.confirmpass == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: mainColor,
                      ),
                    ),
                    controller: confirmPasswordController,
                    hint: 'confirm password',
                    secure: myCubit.confirmpass),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                    title: 'Change password',
                    function: () {
                      if (oldPasswordController.text.isEmpty ||
                          newPasswordController.text.isEmpty ||
                          confirmPasswordController.text.isEmpty) {
                        errorToast(message: 'Please fill all the data');
                      } else if (oldPasswordController.text !=
                          myCubit.userModel!.password) {
                        errorToast(message: 'Old password doesn\'t match');
                      } else if (newPasswordController.text !=
                          confirmPasswordController.text) {
                        errorToast(message: "password doesn't match");
                      } else if(newPasswordController.text.length<6){
                        errorToast(message: 'Password can\'t be less than 6 characters');
                        }else {
                        myCubit.updatePassword(newPasswordController.text);
                      }
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
