import 'package:cacsa/bindings/splash_binding.dart';
import 'package:cacsa/screens/about/about_menu.dart';
import 'package:cacsa/screens/about/history.dart';
import 'package:cacsa/screens/about/mission_vision.dart';
import 'package:cacsa/screens/auth/auth_binding.dart';
import 'package:cacsa/screens/auth/login_view.dart';
import 'package:cacsa/screens/auth/refral_view.dart';
import 'package:cacsa/screens/auth/signUp_view.dart';
import 'package:cacsa/screens/auth/success_view.dart';
import 'package:cacsa/screens/branches/branches.dart';
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
  static const SUCCESS = '/success';
  static const REFERAL = '/refral';
  static const HISTORY = '/history';
  static const MISSION = '/mission';
}

class Pages {
  static const SPLASHSCREEN = Routes.INITIAL;
  static final routes = [
    GetPage(
      name: SPLASHSCREEN,
      page: () => const SplashScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MAIN_PAGE,
      page: () => WelcomePage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MONTHS,
      page: () => const Months(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.ABOUT, page: () => AboutMenu()),
    GetPage(name: Routes.HISTORY, page: () => const History()),
    GetPage(name: Routes.MISSION, page: () => const MissionVision()),
    GetPage(name: Routes.EVENTS, page: () => const UpcomingEvents()),
    GetPage(name: Routes.BRANCHES, page: () => const Branches()),
    GetPage(name: Routes.GIVE, page: () => const Give()),
    GetPage(name: Routes.MANUALS, page: () => const Manuals()),
    GetPage(name: Routes.SUPPORT, page: () => const Support()),
    GetPage(
        name: Routes.LOGIN, page: () => const Login(), binding: AuthBinding()),
    GetPage(
        name: Routes.SIGNUP,
        page: () => const SignUp(),
        binding: AuthBinding()),
    GetPage(name: Routes.SUCCESS, page: () => const Success()),
    GetPage(name: Routes.REFERAL, page: () => const Refral()),
    // GetPage(
    //   name: Routes.DEVOTION,
    //   page: () => DayWalk(),
    // ),
  ];
}
