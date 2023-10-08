import 'package:get/route_manager.dart';
import 'package:solinx_code_test/Core/Core_Route/core_route.dart';
import 'package:solinx_code_test/View/Splash/splash.dart';

class CorePage {
  CorePage._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashScreen())
  ];
}
