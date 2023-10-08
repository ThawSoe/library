// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solinx_code_test/Core/Core_Config/config_constant.dart';
import 'package:solinx_code_test/Core/Core_Config/config_result.dart';
import 'package:solinx_code_test/Core/Core_Config/config_toast.dart';
import 'package:solinx_code_test/View/Auth/home.dart';
import 'package:solinx_code_test/View/Auth/signup.dart';
import 'package:solinx_code_test/View_Model/user_view_model.dart';
import '../../Core/Core_Config/config_util.dart';
import '../../Core/Core_View/background_image.dart';
import '../../Core/Core_View/text_form_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  UserViewModel userContr = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ConfigUtil.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const BackgroundImage(
              image: 'assets/images/login_bg.png',
            ),
            Column(
              children: [
                titleText(),
                TextInputField(
                  controller: userContr.userContr,
                  hint: "User Name",
                  icon: const Icon(Icons.person_2_outlined),
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.next,
                ),
                TextInputField(
                  controller: userContr.pswContr,
                  hint: "Password",
                  icon: const Icon(Icons.lock),
                  inputType: TextInputType.number,
                  inputAction: TextInputAction.done,
                ),
                loginBtn(),
                signUpText(),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Flexible titleText() => Flexible(
        child: Center(
          child: Text(
            'Solinx'.toUpperCase().toString(),
            style: ConfigConstant.kHeader1Style,
          ),
        ),
      );

  Widget loginBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: CupertinoButton.filled(
        onPressed: () async {
          Result result = await userContr.checkRegisterData();
          if (result.success) {
            userContr.saveUserData(result.data);
            ConfigToast.toast(msg: "Login Successfully !");
            Get.offAll(() => HomeScreen());
          } else {
            ConfigToast.toast(msg: result.errorMessage, status: false);
          }
        },
        child: const Text('Login'),
      ),
    );
  }

  GestureDetector signUpText() => GestureDetector(
        onTap: () => Get.to(() => SignUpScreen()),
        child: const Text('Create New Account',
            style: ConfigConstant.kUnderLineTextStyle),
      );
}
