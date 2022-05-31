import 'package:flutter/material.dart';
import 'package:hamo_app/presentation/resources/fonts_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

//Light Style
TextStyle getLightTextStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstant.fontFamilyUrbanist,
      FontWeightManager.light, color);
}

//Regular Style
TextStyle getRegularTextStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstant.fontFamilyUrbanist,
      FontWeightManager.regular, color);
}

//Medium Style
TextStyle getMediumTextStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstant.fontFamilyUrbanist,
      FontWeightManager.medium, color);
}

//SemiBold Style
TextStyle getSemiBoldTextStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize, FontConstant.fontFamilyUrbanist,
      FontWeightManager.semiBold, color);
}

//Bold Style
TextStyle getBoldTextStyle(
    {double fontSize = FontSize.s20, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstant.fontFamilyUrbanist, FontWeightManager.bold, color);
}
