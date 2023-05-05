import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_states.dart';
import 'package:fakka/View/Screens/send_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomNavBarCubit myCubit = BottomNavBarCubit.get(context);
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.1),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SendMoneyScreen(
                                type: 3,
                                requestedMoney: myCubit
                                    .userModel!
                                    .notifications[myCubit
                                            .userModel!.notifications.length -
                                        index -
                                        1]
                                    .money
                                    .toString(),
                                userName: myCubit
                                    .userModel!
                                    .notifications[myCubit
                                            .userModel!.notifications.length -
                                        index -
                                        1]
                                    .userName
                                    .toString(),
                              ),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          color:
                              myCubit.userModel!.notifications[index].opened ==
                                      false
                                  ? Colors.purple.withOpacity(0.2)
                                  : Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.05,
                                0,
                                MediaQuery.of(context).size.width * 0.05,
                                0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      '${myCubit.userModel!.notifications[myCubit.userModel!.notifications.length - index - 1].image}'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    '${myCubit.userModel!.notifications[myCubit.userModel!.notifications.length - index - 1].userName} has requested ${myCubit.userModel!.notifications[myCubit.userModel!.notifications.length - index - 1].money} EGP',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  '${myCubit.userModel!.notifications[myCubit.userModel!.notifications.length - index - 1].date}',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: const Divider(
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                  itemCount: myCubit.userModel!.notifications.length),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 20, MediaQuery.of(context).size.width * 0.05, 0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close)),
            )
          ],
        );
      },
    );
  }
}
