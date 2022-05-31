import 'package:flutter/material.dart';
import 'package:hamo_app/presentation/resources/color_manager.dart';
import 'package:hamo_app/presentation/resources/fonts_manager.dart';
import 'package:hamo_app/presentation/resources/style_manager.dart';
import 'package:hamo_app/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryFill,
    // backgroundColor: ColorManager.secondary,
    disabledColor: ColorManager.disableButton,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.secondary),

    // Card View
    cardTheme: CardTheme(
      color: ColorManager.secondary,
      shadowColor: ColorManager.shadowColor,
      elevation: AppSize.s8,
    ),

    // App bar of the theme
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),

    //Button Theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.disableButton,
        buttonColor: ColorManager.primary),

    // Text Theme
    textTheme: TextTheme(
        headline1: getSemiBoldTextStyle(
            color: ColorManager.black, fontSize: FontSize.s16),
        headline2: getMediumTextStyle(
            color: ColorManager.black, fontSize: FontSize.s14),
        subtitle1: getRegularTextStyle(color: ColorManager.black),
        caption: getLightTextStyle(color: ColorManager.black),
        bodyText1: getRegularTextStyle(color: ColorManager.black)),
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorManager.primaryFill,
      focusColor: ColorManager.secondaryFill,
      hintStyle: getRegularTextStyle(color: ColorManager.hintColor),
      labelStyle: getRegularTextStyle(color: ColorManager.black),
      // Enabled Border
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s1),
        ),
      ),
      // Focused Border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryBorder, width: AppSize.s1),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s1),
        ),
      ),
      // Error Border

      // Focused Error Border
    ),
  );
}
