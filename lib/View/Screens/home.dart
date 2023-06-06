import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Reusable/circle_button.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Reusable/payment_info.dart';
import 'package:fakka/View/Screens/add_money.dart';
import 'package:fakka/View/Screens/bills.dart';
import 'package:fakka/View/Screens/notifications.dart';
import 'package:fakka/View/Screens/payment_methos.dart';
import 'package:fakka/View/Screens/phone_number.dart';
import 'package:fakka/View/Screens/profile.dart';
import 'package:fakka/View/Screens/recharge.dart';
import 'package:fakka/View/Screens/send_money.dart';
import 'package:fakka/View/Screens/skelaton_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'donation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomNavBarCubit myCubit = BottomNavBarCubit.get(context);
        return myCubit.userModel == null || state is BottomNavBarLoadingState
            ? const SkelatonScreen()
            : Scaffold(
                appBar: AppBar(
                  title: const Text('Home'),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                      child: InkWell(
                          onTap: () {
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
                                              0.9,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: const NotificationsScreen()),
                                ],
                              ),
                            );
                          },
                          child: const Icon(Icons.notifications,
                              size: 30, color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            elevation: 10,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Wrap(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.9,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: const ProfileScreen()),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          backgroundImage: AssetImage(
                            myCubit.userModel!.image!,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: horizontalPadding(context, top: 0, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(context).size.height * 0.01, 0, 5),
                        child: Text(
                            'EGP ${myCubit.userModel!.money + myCubit.userModel!.recievedMoney - myCubit.userModel!.paidMoney}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Text(
                        'Current balance',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.675,
                        child: RefreshIndicator(
                          color: mainColor,
                          onRefresh: () async {
                            await myCubit.getUser(context);
                          },
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleButton(
                                        function: () {
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
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: AddMoney(
                                                    requestMoneyFunction: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const SendMoneyScreen(
                                                              type: 2,
                                                            ),
                                                          ));
                                                    },
                                                    etisalatFunction: () {
                                                      myCubit.launch(
                                                          'https://play.google.com/store/apps/details?id=com.etisalat.flous&hl=en&gl=US');
                                                    },
                                                    orangeFunction: () {
                                                      myCubit.launch(
                                                          'https://play.google.com/store/apps/details?id=com.orange.eg.money&hl=en&gl=US');
                                                    },
                                                    vodafoneFunction: () {
                                                      myCubit.launch(
                                                          'https://play.google.com/store/apps/details?id=com.emeint.android.myservices&hl=en&gl=US');
                                                    },
                                                    weFunction: () {
                                                      myCubit.launch(
                                                          'https://play.google.com/store/apps/details?id=com.TE.WEWallet&hl=en&gl=US');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.075,
                                        ),
                                        title: 'Add money',
                                      ),
                                      CircleButton(
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
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.35,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: PaymentMethodsScreen(
                                                      function: () {
                                                        myCubit.scanQrCode(
                                                            context);
                                                      },
                                                    )),
                                              ],
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.075,
                                        ),
                                        title: 'Send money',
                                      ),
                                      CircleButton(
                                        color: secondaryColor,
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
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.35,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: BillsScreen(
                                                      eleBill: () {
                                                        myCubit.launch(
                                                            'https://ncedc.gov.eg/AhliPayment');
                                                      },
                                                      waterBill: () {
                                                        myCubit.launch(
                                                            'https://www.hcww.com.eg/bill-payment/');
                                                      },
                                                    )),
                                              ],
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.payments,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.075,
                                        ),
                                        title: 'Bills',
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleButton(
                                        color: secondaryColor,
                                        function: () {
                                          myCubit.launch(
                                              'https://play.google.com/store/apps/details?id=com.axismarkets.thndr&hl=en&gl=US');
                                        },
                                        icon: const Image(
                                            image: AssetImage(
                                                'assets/images/thndr.png')),
                                        title: 'Thndr',
                                      ),
                                      CircleButton(
                                        color: secondaryColor,
                                        function: () {
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
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  child: RechargeScreen(
                                                    etisalatFunction: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PhoneNumberScreen(
                                                              userName:
                                                                  'Etisalat',
                                                            ),
                                                          ));
                                                    },
                                                    orangeFunction: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PhoneNumberScreen(
                                                              userName:
                                                                  'orange ',
                                                            ),
                                                          ));
                                                    },
                                                    vodafoneFunction: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PhoneNumberScreen(
                                                              userName:
                                                                  'Vodafone ',
                                                            ),
                                                          ));
                                                    },
                                                    weFunction: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PhoneNumberScreen(
                                                              userName: 'we',
                                                            ),
                                                          ));
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.phone_android,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.075,
                                        ),
                                        title: 'Recharge',
                                      ),
                                      CircleButton(
                                        color: secondaryColor,
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
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.6,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: DonationScreen(
                                                      heartFunction: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const SendMoneyScreen(
                                                                type: 4,
                                                                userName:
                                                                    'magdi yacoub heart foundation',
                                                              ),
                                                            ));
                                                      },
                                                      darFunction: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const SendMoneyScreen(
                                                                type: 4,
                                                                userName:
                                                                    'dar el orman',
                                                              ),
                                                            ));
                                                      },
                                                      cancerFunction: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const SendMoneyScreen(
                                                                type: 4,
                                                                userName:
                                                                    '57357',
                                                              ),
                                                            ));
                                                      },
                                                      resalaFunction: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const SendMoneyScreen(
                                                                type: 4,
                                                                userName:
                                                                    'resala',
                                                              ),
                                                            ));
                                                      },
                                                    )),
                                              ],
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.volunteer_activism_outlined,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.075,
                                        ),
                                        title: 'Donation',
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: Text(
                                    'Payment history',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            myCubit
                                                .paymentByDateModelList[myCubit
                                                        .paymentByDateModelList
                                                        .length -
                                                    1 -
                                                    index]
                                                .date!,
                                            style: TextStyle(
                                                color: mainColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(height: 20),
                                          ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index2) {
                                                return Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.01),
                                                    child: PaymentInfo(
                                                      image: myCubit
                                                          .paymentByDateModelList[
                                                              myCubit.paymentByDateModelList
                                                                      .length -
                                                                  1 -
                                                                  index]
                                                          .paymentsHistory[myCubit
                                                                  .paymentByDateModelList[myCubit
                                                                          .paymentByDateModelList
                                                                          .length -
                                                                      1 -
                                                                      index]
                                                                  .paymentsHistory
                                                                  .length -
                                                              1 -
                                                              index2]
                                                          .image!,
                                                      money: Text(
                                                          myCubit
                                                                      .paymentByDateModelList[myCubit
                                                                              .paymentByDateModelList
                                                                              .length -
                                                                          1 -
                                                                          index]
                                                                      .paymentsHistory[
                                                                          myCubit.paymentByDateModelList[myCubit.paymentByDateModelList.length - 1 - index].paymentsHistory.length -
                                                                              1 -
                                                                              index2]
                                                                      .recieved ==
                                                                  0
                                                              ? '-EGP ${myCubit.paymentByDateModelList[myCubit.paymentByDateModelList.length - 1 - index].paymentsHistory[myCubit.paymentByDateModelList[myCubit.paymentByDateModelList.length - 1 - index].paymentsHistory.length - 1 - index2].sent}'
                                                              : '+EGP ${myCubit.paymentByDateModelList[myCubit.paymentByDateModelList.length - 1 - index].paymentsHistory[myCubit.paymentByDateModelList[myCubit.paymentByDateModelList.length - 1 - index].paymentsHistory.length - 1 - index2].recieved}',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: myCubit
                                                                          .paymentByDateModelList[myCubit.paymentByDateModelList.length - 1 - index]
                                                                          .paymentsHistory[myCubit.paymentByDateModelList[myCubit.paymentByDateModelList.length - 1 - index].paymentsHistory.length - 1 - index2]
                                                                          .recieved ==
                                                                      0
                                                                  ? Colors.red
                                                                  : Colors.green)),
                                                      time: myCubit
                                                          .paymentByDateModelList[
                                                              myCubit.paymentByDateModelList
                                                                      .length -
                                                                  1 -
                                                                  index]
                                                          .paymentsHistory[myCubit
                                                                  .paymentByDateModelList[myCubit
                                                                          .paymentByDateModelList
                                                                          .length -
                                                                      1 -
                                                                      index]
                                                                  .paymentsHistory
                                                                  .length -
                                                              1 -
                                                              index2]
                                                          .time!,
                                                      username: myCubit
                                                          .paymentByDateModelList[
                                                              myCubit.paymentByDateModelList
                                                                      .length -
                                                                  1 -
                                                                  index]
                                                          .paymentsHistory[myCubit
                                                                  .paymentByDateModelList[myCubit
                                                                          .paymentByDateModelList
                                                                          .length -
                                                                      1 -
                                                                      index]
                                                                  .paymentsHistory
                                                                  .length -
                                                              1 -
                                                              index2]
                                                          .name!,
                                                    ));
                                              },
                                              separatorBuilder:
                                                  (context, index2) =>
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                              itemCount: myCubit
                                                  .paymentByDateModelList[myCubit
                                                          .paymentByDateModelList
                                                          .length -
                                                      1 -
                                                      index]
                                                  .paymentsHistory
                                                  .length)
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 30,
                                        ),
                                    itemCount:
                                        myCubit.paymentByDateModelList.length)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
