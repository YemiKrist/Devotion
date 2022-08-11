import 'package:cacsa/models/about_menu.dart';

class AboutMenuItems {
  static List<AboutLMenu> getMenuItems() {
    return [
      AboutLMenu(name: 'CACSA\nHISTORY', route: 'history'),
      AboutLMenu(
          name: 'OUR MISSION, VISION\nAND CORE VALUES', route: 'mission'),
      AboutLMenu(name: 'OUR\nBUSINESS VENTURES', route: 'history'),
      AboutLMenu(name: 'WATCH US\nLIVE!', route: 'history'),
    ];
  }
}
