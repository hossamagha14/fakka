import 'package:fakka/View%20Model/Sign%20up/sign_up_cubit.dart';
import 'package:fakka/View%20Model/Sign%20up/sign_up_states.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/my_button.dart';
import 'package:fakka/View/Reusable/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'loading_screen.dart';

class SelectImageScreen extends StatelessWidget {
  final String email;
  final String password;
  final String userName;
  final String cardHolderName;
  final String cardPassword;
  final String address;
  final String nationalId;
  const SelectImageScreen(
      {Key? key,
      required this.email,
      required this.password,
      required this.cardHolderName,
      required this.cardPassword,
      required this.address,
      required this.nationalId,
      required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoadingSrceen(),
                ));
          }
        },
        builder: (context, state) {
          SignUpCubit myCubit = SignUpCubit.get(context);
          return Padding(
            padding: horizontalPadding(context, top: 20, bottom: 0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    'Choose your avatar',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: mainColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(10, (index) {
                        return InkWell(
                          onTap: () {
                            myCubit.chooseImage(index);
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Visibility(
                                visible:
                                    myCubit.imageIndex == index ? true : false,
                                child: CircleAvatar(
                                  backgroundColor: mainColor,
                                  radius: 50,
                                ),
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 47.5,
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(myCubit.avatars[index]),
                                backgroundColor: Colors.white,
                                radius: 45,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  MyButton(
                      title: 'Create account',
                      function: () {
                        if (myCubit.imageIndex == null ||
                            myCubit.imageString == null) {
                          errorToast(message: 'Please choose an avatar');
                        } else {
                          myCubit.checkUserAndCreateAccount(context,
                              cardPassword: cardPassword,
                              email: email,
                              birthday: DateFormat('dd / MM / y')
                                  .format(myCubit.birthday!),
                              address: address,
                              nationalId: nationalId,
                              cardHolderName: cardHolderName,
                              username: userName,
                              image: myCubit.imageString!,
                              password: password);
                        }
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
