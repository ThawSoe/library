import 'dart:convert';

import 'package:get/get.dart';
import 'package:solinx_code_test/Core/Core_Config/config_constant.dart';
import 'package:solinx_code_test/Core/Core_Config/config_toast.dart';
import 'package:solinx_code_test/Service/Storage/storage_manager.dart';
import 'package:solinx_code_test/View/Auth/signin.dart';

import '../Model/user_model.dart';

class LocalRepository {
  static logout() {
    StorageManager.instance.deleteData(key: ConfigConstant.s_user);
    ConfigToast.toast(msg: "Logout Successfully !");
    Get.offAll(() => SignInScreen());
  }

  static deleteAccount() async {
    List<UserDTO>? userList = [];
    var temp = await StorageManager.instance
        .getData(key: ConfigConstant.s_register_user);
    if (temp != null) {
      userList = registerUserFromJson(jsonDecode(temp));
    }

    //remove current account
    for (var element in userList) {
      if (element.userName == StorageManager.instance.user?.userName) {
        userList.remove(element);
        break;
      }
    }

    //need to remove login account
    StorageManager.instance.deleteData(key: ConfigConstant.s_user);

    //To save again local storage
    StorageManager.instance.saveData(
        key: ConfigConstant.s_register_user,
        value: jsonEncode(registerUserToJson(userList)));

    ConfigToast.toast(msg: "Account delete successfully !");
    Get.offAll(() => SignInScreen());
  }
}
