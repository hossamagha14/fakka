import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Screens/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomNavBarCubit myCubit = BottomNavBarCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 80, 0, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage(myCubit.userModel!.image!),
                          ),
                          Text(
                            myCubit.userModel!.name!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          QrCodeScreen(userName: myCubit.userModel!.name!),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.83,
                                child: const Text(
                                  'Let the vendor scan your QR code to send you money.',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      content: Stack(
                                        alignment: AlignmentDirectional.topEnd,
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.6,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            color: Colors.white,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Lottie.asset(
                                                    'assets/animation/scan_qr_code.json'),
                                                const Text(
                                                  'Let the vendor or the sender of the money open the application, press on send money then choose the QR code option then scan your QR code To send you money easily.',
                                                  style: TextStyle(
                                                      color: Colors.black87),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Icon(Icons.close)),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.info,
                                  color: mainColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close)),
              )
            ],
          ),
        );
      },
    );
  }
}
