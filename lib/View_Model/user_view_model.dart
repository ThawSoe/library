import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solinx_code_test/Core/Core_Config/config_constant.dart';
import 'package:solinx_code_test/Core/Core_Config/config_result.dart';
import 'package:solinx_code_test/Core/Core_Config/config_toast.dart';
import 'package:solinx_code_test/Data/Model/user_model.dart';
import 'package:solinx_code_test/Data/Repository/local_repository.dart';
import 'package:solinx_code_test/Service/Storage/storage_manager.dart';
import 'package:solinx_code_test/View/Auth/signin.dart';

class UserViewModel extends GetxController {
  final TextEditingController userContr = TextEditingController();
  final TextEditingController pswContr = TextEditingController();
  UserDTO userDTO = UserDTO();

  signUp() async {
    if (userContr.text.isNotEmpty && pswContr.text.isNotEmpty) {
      userDTO.userName = userContr.text.toString();
      userDTO.psw = pswContr.text.toString();
      debugPrint("${userDTO.userName},${userDTO.psw}");

      //to save for login user
      List<UserDTO>? userList;
      var temp = await StorageManager.instance
          .getData(key: ConfigConstant.s_register_user);
      if (temp != null) {
        userList = registerUserFromJson(jsonDecode(temp));
      }
      var contain = userList?.where(
          (element) => element.userName == (userDTO.userName.toString()));
      if (contain?.isNotEmpty ?? false) {
        saveRegisterData(userList ?? []);
      } else {
        userList?.add(UserDTO(userName: userContr.text, psw: pswContr.text));
        saveRegisterData(userList ??
            [UserDTO(userName: userContr.text, psw: pswContr.text)]);
      }
      userContr.clear();
      pswContr.clear();
      ConfigToast.toast(msg: "Register Successfully !\n Please login login");
      Get.off(() => SignInScreen());
    } else {
      ConfigToast.toast(
          msg: "Please enter username and password", status: false);
    }
  }

  saveRegisterData(List<UserDTO> user) => StorageManager.instance.saveData(
      key: ConfigConstant.s_register_user,
      value: jsonEncode(registerUserToJson(user)));

  saveUserData(UserDTO user) => StorageManager.instance
      .saveData(key: ConfigConstant.s_user, value: jsonEncode(user.toJson()));

  Future<Result> checkRegisterData() async {
    List<UserDTO>? userList = [];
    UserDTO tempUser = UserDTO();
    var temp = await StorageManager.instance
        .getData(key: ConfigConstant.s_register_user);
    if (temp != null) {
      userList = registerUserFromJson(jsonDecode(temp));
    }

    for (var element in userList) {
      if (element.userName == userContr.text) {
        if (element.psw == pswContr.text) {
          tempUser = element;
          return Result.success(data: tempUser);
        } else {
          return Result.error("Incorrect password !");
        }
      }
    }
    return Result.error("Please first register !");
  }

  logout() => LocalRepository.logout();

  deleteAccount() => LocalRepository.deleteAccount();
}
