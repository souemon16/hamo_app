import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#8937FF");
  static Color secondary = HexColor.fromHex("#FFFFFF");
  static Color primaryBorder = HexColor.fromHex("#ECDEFF");
  static Color primaryFill = HexColor.fromHex("#FAFAFA");
  static Color secondaryFill = HexColor.fromHex("#F4ECFF");
  static Color disableButton = HexColor.fromHex("#6F3ABB");
  static Color shadowColor = HexColor.fromHex("#F7F7F7");
  static Color black = HexColor.fromHex("#262626");
  static Color hintColor = HexColor.fromHex("#9E9E9E");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', "");
    // ignore: unrelated_type_equality_checks
    if (hexColorString == 6) {
      hexColorString = "FF" + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
