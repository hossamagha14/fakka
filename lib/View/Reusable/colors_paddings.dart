import 'package:flutter/material.dart';

import '../../View Model/database/cache_helpher.dart';

String uid = CacheHelper.getData(key: 'uid');
Color mainColor = const Color(0xFF5E41A5);
Color secondaryColor = const Color.fromARGB(255, 175, 119, 185);
EdgeInsetsGeometry horizontalPadding(context,
    {required double top, required double bottom}) {
  return EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, top,
      MediaQuery.of(context).size.width * 0.05, bottom);
}

bool birthDayOpened = CacheHelper.getData(key: 'birthDayOpened') ?? false;
bool targetOpened= CacheHelper.getData(key: 'targetOpened') ?? false;
