import 'package:cacsa/models/menu.dart';

class MenuItems {
  static List<Menu> getMenuItems() {
    return [
      Menu(name: 'Daily Walk 2022', icon: 'book_open'),
      Menu(name: 'CACSA Manual', icon: 'bookmark'),
      Menu(name: 'Upcoming Events', icon: 'calendar'),
      Menu(name: 'Branch Locations', icon: 'map_pin'),
      Menu(name: 'About CACSA', icon: 'info'),
      Menu(name: 'Give', icon: 'naira'),
      Menu(name: 'Support', icon: 'help_circle')
    ];
  }
}
