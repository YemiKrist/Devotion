import 'package:cacsa/screens/day_walk.dart';
import 'package:cacsa/screens/splash_screen.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:get/get.dart';

class Routes {
  static const INITIAL = '/splash';
  static const MAIN_PAGE = '/main_page';
  static const DAILY_WALK = '/daily';
  static const DEVOTION = '/devotion';
}

class Pages {
  static const SPLASHSCREEN = Routes.INITIAL;
  static final routes = [
    GetPage(
      name: SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.MAIN_PAGE,
      page: () => WelcomePage(),
    ),
    // GetPage(
    //   name: Routes.DEVOTION,
    //   page: () => DayWalk(),
    // ),
  ];
}
