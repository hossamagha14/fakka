import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/settings_button.dart';
import 'package:fakka/View/Screens/about%20_us.dart';
import 'package:fakka/View/Screens/edit_password.dart';
import 'package:fakka/View/Screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_us.dart';

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
          return Stack(
            children: [
              Padding(
                padding: horizontalPadding(context, top: 0, bottom: 0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.51,
                      ),
                      SettingsButton(
                          label: 'About us',
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AboutUsScreen(),
                                ));
                          }),
                      SettingsButton(
                          label: 'Contact us',
                          function: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              elevation: 10,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => Wrap(
                                children: [
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.45,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: ContactUsScreen(
                                        facebookFunction: () {
                                          myCubit.launch(
                                              'https://www.facebook.com/profile.php?id=100093098662471&mibextid=LQQJ4d');
                                        },
                                        instagramFunction: () {
                                          myCubit.launch(
                                              'https://instagram.com/fakka.app.egy?igshid=OGQ5ZDc2ODk2ZA==');
                                        },
                                        linkedInFunction: () {
                                          myCubit.launch(
                                              'https://www.linkedin.com/company/fakka-app-egy/about/?viewAsMember=true');
                                        },
                                      )),
                                ],
                              ),
                            );
                          }),
                      SettingsButton(
                          label: 'Change password',
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditPassword(),
                                ));
                          }),
                      SettingsButton(
                          label: 'Sign out',
                          function: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                                (route) => false);
                          }),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.49,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.08,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(myCubit.userModel!.image!)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      myCubit.userModel!.name!,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Points',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${myCubit.userModel!.points}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Birthday',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500)),
                            Text('${myCubit.userModel!.birthday}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
