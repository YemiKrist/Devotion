import 'package:cacsa/models/menu.dart';

class MenuItems {
  static List<Menu> getMenuItems() {
    return [
      Menu(name: 'Daily\nWalk 2022', icon: 'book_open', route: 'months'),
      Menu(name: 'CACSA\nManual', icon: 'bookmark', route: 'manuals'),
      Menu(name: 'Upcoming\nEvents', icon: 'calendar', route: 'events'),
      Menu(name: 'Branch\nLocations', icon: 'map_pin', route: 'branches'),
      Menu(name: 'About\nCACSA', icon: 'info', route: 'about'),
      Menu(name: 'Give', icon: 'naira', route: 'give'),
      Menu(name: 'Support', icon: 'help_circle', route: 'support'),
      Menu(name: 'Log Out', icon: 'log-out', route: 'logout')
    ];
  }
}
