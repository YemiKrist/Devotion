// ignore_for_file: constant_identifier_names

import 'package:cacsa/screens/Misc.dart';
import 'package:cacsa/screens/about/about_menu.dart';
import 'package:cacsa/screens/about/founder.dart';
import 'package:cacsa/screens/about/history.dart';
import 'package:cacsa/screens/about/leader.dart';
import 'package:cacsa/screens/about/mission_vision.dart';
import 'package:cacsa/screens/auth/auth_binding.dart';
import 'package:cacsa/screens/auth/login_view.dart';
import 'package:cacsa/screens/auth/refral_view.dart';
import 'package:cacsa/screens/auth/signUp_view.dart';
import 'package:cacsa/screens/auth/success_view.dart';
import 'package:cacsa/screens/branches/Branch_menu.dart';
import 'package:cacsa/screens/branches/branches.dart';
import 'package:cacsa/screens/events/upcoming_events.dart';
import 'package:cacsa/screens/give/give.dart';
import 'package:cacsa/screens/manuals/Believers_Treasure_Yoruba/list.dart';
import 'package:cacsa/screens/manuals/constitution.dart';
import 'package:cacsa/screens/manuals/discipleship/table_of_content.dart';
import 'package:cacsa/screens/manuals/manuals.dart';
import 'package:cacsa/screens/media/MediaView.dart';
import 'package:cacsa/screens/months_screen.dart';
import 'package:cacsa/screens/notifications/notifications.dart';
import 'package:cacsa/screens/settings/settings.dart';
import 'package:cacsa/screens/splash_screen.dart';
import 'package:cacsa/screens/support/support.dart';
import 'package:cacsa/screens/welcome_page.dart';
import 'package:get/get.dart';
import '../screens/manuals/study_list.dart';
import '../screens/manuals/workers_manual/table_of_content.dart';

class Routes {
  static const NOTIFICATIONS = "/notifications";
  static const INITIAL = '/splash';
  static const MAIN_PAGE = '/main_page';
  static const DAILY_WALK = '/daily';
  static const DEVOTION = '/devotion';
  static const MONTHS = '/months';
  static const MANUALS = '/manuals';
  static const EVENTS = '/events';
  static const BRANCHES = '/branches';
  static const CHURCHES = '/churches';
  static const ABOUT = '/about';
  static const GIVE = '/give';
  static const SUPPORT = '/support';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const SUCCESS = '/success';
  static const REFERAL = '/refral';
  static const HISTORY = '/history';
  static const MISSION = '/mission';
  static const LEADER = "/leader";
  static const FOUNDER = "/founder";
  static const SETTINGS = '/settings';
  static const MEDIA = "/media";
  static const BOTTOMBAR = "/bottombar";
  static const CONSTITUTION = "/constitution";
  static const BELIEVERS = "/believers";
  static const WORKERS = "/workers";

  // routes for miscelleaneus
  static const MISC = "/misc";

  // routes for bible study
  static const STUDIES = '/studies';
  //yoruba bible studies
  static const YORUBASTUDIES = '/studies_yoruba';
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
      page: () => const WelcomePage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MONTHS,
      page: () => const Months(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.ABOUT, page: () => AboutMenu()),
    GetPage(name: Routes.HISTORY, page: () => const History()),
    GetPage(name: Routes.LEADER, page: () => const LeadersBio()),
    GetPage(name: Routes.FOUNDER, page: () => const FounderBio()),
    GetPage(name: Routes.MISSION, page: () => const MissionVision()),
    GetPage(name: Routes.EVENTS, page: () => const UpcomingEvents()),
    GetPage(name: Routes.BRANCHES, page: () => BranchLocationsMenu()),
    GetPage(name: Routes.GIVE, page: () => const Give()),
    GetPage(name: Routes.MANUALS, page: () => Manuals()),
    GetPage(name: Routes.SUPPORT, page: () => const Support()),
    GetPage(name: Routes.CHURCHES, page: () => Branches()),
    GetPage(name: Routes.SETTINGS, page: () => const Settings()),
    GetPage(name: Routes.MEDIA, page: (() => const MediaView())),
    GetPage(
        name: Routes.NOTIFICATIONS, page: (() => const NotificationWidget())),

    GetPage(
        name: Routes.LOGIN, page: () => const Login(), binding: AuthBinding()),
    GetPage(
        name: Routes.SIGNUP,
        page: () => const SignUp(),
        binding: AuthBinding()),
    GetPage(name: Routes.SUCCESS, page: () => const Success()),
    GetPage(name: Routes.REFERAL, page: () => const Refral()),

    // pages route for bible study
    GetPage(name: Routes.STUDIES, page: () => Studies()),
    GetPage(name: Routes.YORUBASTUDIES, page: () => AwonEko()),
    GetPage(name: Routes.MISC, page: (() => const Misc())),
    // GetPage(
    //   name: Routes.DEVOTION,
    //   page: () => DayWalk(),
    // ),
    GetPage(name: Routes.CONSTITUTION, page: (() => Constitution())),
    GetPage(name: Routes.BELIEVERS, page: (() => const DiscipleshipManuals())),
    GetPage(name: Routes.WORKERS, page: (() => const WorkersManuals())),
  ];
}
