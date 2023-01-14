import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';
import 'styles.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorsManager.black,
    primaryColorDark: ColorsManager.black,
    primaryColorLight: ColorsManager.black,
    backgroundColor: ColorsManager.black,
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline1:
          getRegularStyle(color: ColorsManager.white, fontSize: FontSizes.s22),
      headline2:
          getBoldStyle(color: ColorsManager.white, fontSize: FontSizes.s16),
      headline3:
          getRegularStyle(color: ColorsManager.white, fontSize: FontSizes.s14),
      headline4:
          getRegularStyle(color: ColorsManager.white, fontSize: FontSizes.s14),
      headline5: getRegularStyle(
        color: ColorsManager.white.withOpacity(0.5),
        fontSize: FontSizes.s16,
      ).copyWith(
        height: 0.1,
      ),
      subtitle1: getBoldStyle(
          color: ColorsManager.white.withOpacity(0.5), fontSize: FontSizes.s12),
      subtitle2: getRegularStyle(
          color: ColorsManager.white.withOpacity(0.5), fontSize: FontSizes.s12),
      bodyText1:
          getRegularStyle(color: ColorsManager.white, fontSize: FontSizes.s14),
    ),
  );
}
