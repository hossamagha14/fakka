import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Reusable/my_button.dart';
import 'package:fakka/View/Screens/enter_password.dart';
import 'package:fakka/View/Screens/update_pin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../Reusable/colors_paddings.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Card'),
      ),
      body: BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BottomNavBarCubit myCubit = BottomNavBarCubit.get(context);
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CreditCardWidget(
                        bankName: 'FAKKA',
                        onCreditCardWidgetChange: (p0) {},
                        cardNumber: '${myCubit.userModel!.creditCardNumber}',
                        expiryDate: '      ${myCubit.userModel!.expiryDate}',
                        cardHolderName: ' ${myCubit.userModel!.cardHolderName}',
                        cvvCode: myCubit.userModel!.cvc!,
                        showBackView: myCubit.showCVC,
                        backgroundImage: 'assets/images/creditcard.png',
                        obscureCardNumber: myCubit.showCardNumber,
                        obscureInitialCardNumber: myCubit.showCardNumber,
                        obscureCardCvv: false,
                        isHolderNameVisible: true,
                        height: MediaQuery.of(context).size.height * 0.3,
                        textStyle: TextStyle(
                            color: myCubit.showCVC == false
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        width: MediaQuery.of(context).size.width,
                        isChipVisible: true,
                        isSwipeGestureEnabled: false,
                        chipColor: const Color.fromARGB(255, 238, 238, 32),
                        animationDuration: const Duration(milliseconds: 1000),
                        frontCardBorder: Border.all(color: Colors.grey),
                        backCardBorder: Border.all(color: Colors.grey),
                      ),
                      Visibility(
                        visible: myCubit.userModel!.cardIsLocked,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.04,
                              0,
                              MediaQuery.of(context).size.width * 0.04,
                              0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.8),
                            ),
                            child: const Icon(
                              Icons.lock,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  MyButton(
                      title: myCubit.showCardNumber == true
                          ? 'See my card card number'
                          : 'Hide my card card number',
                      function: () {
                        if (myCubit.showCardNumber == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EnterPasswordScreen(checkType: 1),
                              ));
                        } else {
                          myCubit.showMyCardNumber();
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                      title: myCubit.showCVC == false
                          ? 'See my card CVC'
                          : 'Hide my card CVC',
                      function: () {
                        if (myCubit.showCVC == false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EnterPasswordScreen(checkType: 2),
                              ));
                        } else {
                          myCubit.showMyCVC();
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
                                  radius: 23,
                                  child: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Lock Card',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Transform.scale(
                              scale: 0.9,
                              child: CupertinoSwitch(
                                value: myCubit.userModel!.cardIsLocked,
                                onChanged: (value) {
                                  if (myCubit.userModel!.cardIsLocked ==
                                      false) {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      elevation: 10,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) => Wrap(
                                        children: [
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.05,
                                                    20,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.05,
                                                    20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.grey.shade300,
                                                      radius: 50,
                                                      child: const Icon(
                                                        Icons.lock,
                                                        color: Colors.black,
                                                        size: 50,
                                                      ),
                                                    ),
                                                    const Text(
                                                        'What happens when I lock my card?',
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.black)),
                                                    const Text(
                                                        'Temporarily lock your card payments, ATM withdrawls and online purchases. You can unlock your card instantly anytime.',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.black)),
                                                    Center(
                                                      child: MyButton(
                                                          title: 'Lock my card',
                                                          function: () {
                                                            myCubit.lockCard(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                    ),
                                                    Center(
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              color: mainColor,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                    );
                                  } else {
                                    myCubit.lockCard(context);
                                  }
                                },
                                activeColor: mainColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdatePinScreen1(),
                          ));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.grey.shade300,
                                child: const Icon(
                                  Icons.password,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Change PIN',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700)),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
