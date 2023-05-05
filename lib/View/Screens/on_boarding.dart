import 'package:fakka/View%20Model/On%20boarding/on_boarding_cubit.dart';
import 'package:fakka/View%20Model/On%20boarding/on_boarding_states.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:fakka/View/Screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
          listener: (context, state) {},
          builder: (context, state) {
            OnBoardingCubit myCubit = OnBoardingCubit.get(context);
            return SafeArea(
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: myCubit.onBoardingList.length,
                            controller: controller,
                            onPageChanged: (value) => myCubit.lastPage(value),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: Image(
                                            image: AssetImage(myCubit
                                                .onBoardingList[index]
                                                .image!))),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      myCubit.onBoardingList[index].title1!,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: mainColor),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(myCubit.onBoardingList[index].title2!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: secondaryColor)),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SmoothPageIndicator(
                            controller: controller,
                            effect: WormEffect(
                                activeDotColor: mainColor,
                                dotWidth: 12,
                                dotHeight: 12,
                                spacing: 7),
                            count: myCubit.onBoardingList.length),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.055,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          mainColor),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                              onPressed: () {
                                if (myCubit.isLastPage == false) {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                } else if (myCubit.isLastPage == true) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInScreen(),
                                      ),
                                      (route) => false);
                                }
                              },
                              child: Text(
                                myCubit.isLastPage == false
                                    ? 'Next'
                                    : 'Get started',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 35, 25, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                            (route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Skip',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
