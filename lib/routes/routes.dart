import 'package:cacsa/bindings/splash_binding.dart';
import 'package:cacsa/screens/about/about.dart';
import 'package:cacsa/screens/auth/login_view.dart';
import 'package:cacsa/screens/auth/signUp_view.dart';
import 'package:cacsa/screens/branches/branches.dart';
import 'package:cacsa/screens/day_walk.dart';
import 'package:cacsa/screens/events/upcoming_events.dart';
import 'package:cacsa/screens/give/give.dart';
import 'package:cacsa/screens/manuals/manuals.dart';
import 'package:cacsa/screens/months_screen.dart';
import 'package:cacsa/screens/splash_screen.dart';
import 'package:cacsa/screens/support/support.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:get/get.dart';

class Routes {
  static const INITIAL = '/splash';
  static const MAIN_PAGE = '/main_page';
  static const DAILY_WALK = '/daily';
  static const DEVOTION = '/devotion';
  static const MONTHS = '/months';
  static const MANUALS = '/manuals';
  static const EVENTS = '/events';
  static const BRANCHES = '/branches';
  static const ABOUT = '/about';
  static const GIVE = '/give';
  static const SUPPORT = '/support';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
}

class Pages {
  static const SPLASHSCREEN = Routes.INITIAL;
  static final routes = [
    GetPage(
      name: SPLASHSCREEN,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.MAIN_PAGE,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: Routes.MONTHS,
      page: () => const Months(),
    ),
    GetPage(name: Routes.ABOUT, page: () => const About()),
    GetPage(name: Routes.EVENTS, page: () => const UpcomingEvents()),
    GetPage(name: Routes.BRANCHES, page: () => const Branches()),
    GetPage(name: Routes.GIVE, page: () => const Give()),
    GetPage(name: Routes.MANUALS, page: () => const Manuals()),
    GetPage(name: Routes.SUPPORT, page: () => const Support()),
    GetPage(name: Routes.LOGIN, page: () => const Login()),
    GetPage(name: Routes.SIGNUP, page: () => const SignUp()),
    // GetPage(
    //   name: Routes.DEVOTION,
    //   page: () => DayWalk(),
    // ),
  ];
}
