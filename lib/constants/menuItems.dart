import 'package:cacsa/models/manuals_model.dart';
import 'package:cacsa/models/menu.dart';

class MenuItems {
  static List<Menu> getMenuItems() {
    return [
      Menu(name: 'Daily\nWalk 2023', icon: 0, route: 'months'),
      Menu(name: 'CACSA\nManuals', icon: 2, route: 'manuals'),
      // Menu(name: 'Upcoming\nEvents', icon: 'calendar', route: 'events'),
      Menu(name: 'Branch\nLocations', icon: 3, route: 'branches'),
      Menu(name: 'About\nCACSA', icon: 4, route: 'about'),
      Menu(name: 'Give', icon: 5, route: 'give'),
      Menu(name: 'Media', icon: 6, route: 'media'),
      // Menu(name: 'Support', icon: 'help_circle', route: 'support'),
      // Menu(name: 'Log Out', icon: 'log-out', route: 'logout')
    ];
  }

  static List<ManualsMenu> getManualsItems() {
    return [
      ManualsMenu(name: 'Workers\nManual', route: 'workers'),
      ManualsMenu(name: 'Believers\nTreasure', route: 'studies'),
      ManualsMenu(name: 'Cacsa\nConstitution', route: 'workers'),
      ManualsMenu(name: 'Discipleship\nManual', route: 'workers'),
    ];
  }
}
