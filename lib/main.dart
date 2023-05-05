import 'package:fakka/View%20Model/Bottom%20navigation%20bar/bottom_nav_bar_cubit.dart';
import 'package:fakka/View%20Model/Sign%20up/sign_up_cubit.dart';
import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'View Model/database/cache_helpher.dart';
import 'View/Screens/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBarCubit()..getUser(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: mainColor,
                ),
                color: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: mainColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        home: OnBoardingScreen(),
      ),
    );
  }
}
