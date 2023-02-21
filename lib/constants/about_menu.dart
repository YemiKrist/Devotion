import 'package:cacsa/models/about_menu.dart';

class AboutMenuItems {
  static List<AboutLMenu> getMenuItems() {
    return [
      AboutLMenu(name: 'CACSA\nHISTORY', route: 'history'),
      AboutLMenu(
          name: 'OUR MISSION, VISION\nAND CORE VALUES', route: 'mission'),
      AboutLMenu(name: 'FOUNDERS\'\nBIOGRAPHY', route: 'founder'),
      AboutLMenu(name: 'NATIONAL LEADER\nBIOGRAPHY', route: 'leader'),
      AboutLMenu(name: 'OUR\nBUSINESS VENTURES', route: 'misc'),
    ];
  }
}
