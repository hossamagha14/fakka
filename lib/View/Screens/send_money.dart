import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_nav_bar.dart';

// ignore: must_be_immutable
class SendMoneyScreen extends StatefulWidget {
  final int type;
  final String? requestedMoney;
  final String? userName;
  const SendMoneyScreen(
      {Key? key, required this.type, this.requestedMoney, this.userName})
      : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  TextEditingController money = TextEditingController();

  TextEditingController userName = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.type == 3) {
      money.text = widget.requestedMoney!;
      userName.text = widget.userName!;
    } else if (widget.type == 4) {
      userName.text = widget.userName!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          widget.type == 2 ? 'Request money' : 'Send money',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: mainColor,
      ),
      body: BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
        listener: (context, state) {
          if (state is BottomNavBarGetSuccessState) {
            successToast(message: 'Money was sent successfully');
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavBarScreen(),
                ),
                (route) => false);
          } else if (state is BottomNavBarGetRecieverFailState) {
            errorToast(
                message:
                    'User name could not be found, please check the user name and try again');
          } else if (state is BottomNavBarNotificationSuccessState) {
            successToast(message: 'Request was sent successfully');
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavBarScreen(),
                ),
                (route) => false);
          } else if (state is BottomNavBarNotificationFailState) {
            errorToast(
                message:
                    'User name could not be found, please check the user name and try again');
          }
        },
        builder: (context, state) {
          BottomNavBarCubit myCubit = BottomNavBarCubit.get(context);
          return state is BottomNavBarLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Padding(
                  padding: horizontalPadding(context, top: 0, bottom: 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'To: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: TextFormField(
                                controller: userName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: widget.type == 2
                                      ? 'User name'
                                      : 'Reciever User name',
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.8,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 25, 0, 150),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Center(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                controller: money,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '0.00 EGP',
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                              onPressed: () {
                                if (money.text.isEmpty ||
                                    userName.text.isEmpty) {
                                  errorToast(
                                      message:
                                          'Please put both user name and the amount of money to be sent');
                                } else {
                                  if (widget.type == 1 || widget.type == 3 || widget.type==4) {
                                    if (myCubit.userModel!.money +
                                            myCubit.userModel!.recievedMoney +
                                            -myCubit.userModel!.paidMoney <
                                        double.parse(money.text)) {
                                      errorToast(message: 'Not enough money');
                                    } else if (myCubit
                                            .userModel!.cardIsLocked ==
                                        true) {
                                      errorToast(
                                          message:
                                              'Your transaction can\'t be made, as the card is locked');
                                    } else if (double.parse(money.text) % 0.5 !=
                                        0) {
                                      errorToast(
                                          message:
                                              'You can only send 0.5EGP and its multiplys');
                                    } else {
                                      myCubit.sendMoney(context,
                                          recievedMoney:
                                              double.parse(money.text),
                                          recieverUserName: userName.text,
                                          paidMoney: double.parse(money.text) +
                                              myCubit.userModel!.paidMoney,
                                          senderUserName:
                                              myCubit.userModel!.name!);
                                    }
                                  } else if (widget.type == 2) {
                                    if (double.parse(money.text) % 0.5 != 0) {
                                      errorToast(
                                          message:
                                              'You can only request 0.5EGP and its multiplys');
                                    } else if (double.parse(money.text) < 0.5) {
                                      errorToast(
                                          message:
                                              '0.5 EGP is the least amount to request');
                                    } else {
                                      myCubit.requestMoney(
                                          reciever: userName.text,
                                          requesterName:
                                              myCubit.userModel!.name!,
                                          image: myCubit.userModel!.image!,
                                          money: double.parse(money.text));
                                    }
                                  }
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          secondaryColor)),
                              child: const Text(
                                'Send',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )))
                    ],
                  ),
                );
        },
      ),
    );
  }
}
