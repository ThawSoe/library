import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solinx_code_test/Core/Core_Config/config_constant.dart';

class ConfigToast {
  static toast({String? msg, bool status = true}) {
    return Fluttertoast.showToast(
        msg: msg.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: status ? Colors.green : Colors.grey,
        textColor: ConfigConstant.kWhite,
        fontSize: 16.0);
  }
}
