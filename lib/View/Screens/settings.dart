import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/settings_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BottomNavBarCubit myCubit = BottomNavBarCubit.get(context);
          return Padding(
            padding: horizontalPadding(context, top: 0, bottom: 0),
            child: Column(
              children: [
                SettingsButton(label: 'About us', function: () {}),
                SettingsButton(label: 'Contact us', function: () {}),
                SettingsButton(
                    label: 'Sign out',
                    function: () {
                      // CacheHelper.clearToken(key: 'uid');
                      // myCubit.userModel= null;
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => SignInScreen(),
                      //     ),
                      //     (route) => false);
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
