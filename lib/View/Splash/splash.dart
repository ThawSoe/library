import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solinx_code_test/Service/Storage/storage_manager.dart';
import 'package:solinx_code_test/View/Auth/home.dart';
import 'package:solinx_code_test/View/Auth/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkIsLogin();
    super.initState();
  }

  checkIsLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    if (StorageManager.instance.isLoggedIn) {
      Get.to(() => HomeScreen());
    } else {
      Get.offAll(() => SignInScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
