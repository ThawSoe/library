import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solinx_code_test/Core/Core_Route/core_page.dart';

class CoreInit extends StatelessWidget {
  const CoreInit({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // if want only ios => to use GetCupertinoApp
      initialRoute: CorePage.initial,
      getPages: CorePage.routes,
    );
  }
}
