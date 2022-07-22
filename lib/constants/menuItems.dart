import 'package:cacsa/models/menu.dart';

class MenuItems {
  static List<Menu> getMenuItems() {
    return [
      Menu(name: 'Daily Walk 2022', icon: 'book_open', route: 'months'),
      Menu(name: 'CACSA Manual', icon: 'bookmark', route: 'manuals'),
      Menu(name: 'Upcoming Events', icon: 'calendar', route: 'events'),
      Menu(name: 'Branch Locations', icon: 'map_pin', route: 'branches'),
      Menu(name: 'About CACSA', icon: 'info', route: 'about'),
      Menu(name: 'Give', icon: 'naira', route: 'give'),
      Menu(name: 'Support', icon: 'help_circle', route: 'support')
    ];
  }
}
