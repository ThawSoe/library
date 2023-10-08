// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solinx_code_test/Core/Core_Config/config_constant.dart';
import 'package:solinx_code_test/View/Auth/signin.dart';
import 'package:solinx_code_test/View_Model/user_view_model.dart';
import '../../Core/Core_Config/config_util.dart';
import '../../Core/Core_View/background_image.dart';
import '../../Core/Core_View/text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  UserViewModel userContrl = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ConfigUtil.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const BackgroundImage(image: 'assets/images/register_bg.png'),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.40),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.width * 0.1,
                    ),
                    SizedBox(
                      height: Get.width * 0.1,
                    ),
                    Column(
                      children: [
                        TextInputField(
                          controller: userContrl.userContr,
                          hint: "User Name",
                          icon: const Icon(Icons.person_2_outlined),
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.done,
                        ),
                        TextInputField(
                          controller: userContrl.pswContr,
                          hint: "Password",
                          icon: const Icon(Icons.lock),
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.done,
                        ),
                        // TextInputField(
                        //   controller: TextEditingController(),
                        //   hint: "Confirm Password",
                        //   icon: const Icon(Icons.lock),
                        //   inputType: TextInputType.number,
                        //   inputAction: TextInputAction.done,
                        // ),
                        signUpBtn(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account? ',
                              style: ConfigConstant.kBodyTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offAll(() => SignInScreen());
                              },
                              child: Text(
                                'Login',
                                style: ConfigConstant.kBodyTextStyle.copyWith(
                                    color: ConfigConstant.kBlue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signUpBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: CupertinoButton.filled(
        onPressed: () {
          userContrl.signUp();
        },
        child: const Text('Register'),
      ),
    );
  }
}
