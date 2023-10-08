// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class ConfigConstant {
  //Storage Constant
  static const String s_user = "user";
  static const String s_register_user = "register_user";
  static const String s_default = "default";

  //Color Constant
  static const Color kWhite = Colors.white;
  static const Color kBlue = Color(0xff5663ff);
  static const Color kBlack = Colors.black;

  //Style Constant
  static const TextStyle kBodyTextStyle =
      TextStyle(fontSize: 22, color: Colors.white, height: 1.5);

  static const TextStyle kUnderLineTextStyle = TextStyle(
      fontSize: 20,
      color: ConfigConstant.kBlue,
      decoration: TextDecoration.underline);

  static const TextStyle kHeader1Style =
      TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold);

  static const TextStyle kTitleTextStyle = TextStyle(
      fontSize: 18,
      color: kBlack,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis);

  static const TextStyle kSubTitleTextStyle = TextStyle(
      color: kBlack,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis);
}
