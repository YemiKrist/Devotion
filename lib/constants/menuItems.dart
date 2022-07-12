import 'package:cacsa/models/menu.dart';

class MenuItems {
  static List<Menu> getMenuItems() {
    return [
      Menu(name: 'Daily Walk 2022', bgImage: 'daily_walk'),
      Menu(name: 'Workers Manual', bgImage: 'workers_manual'),
      Menu(name: 'Believers Class Manual', bgImage: 'believers_class' ),
      Menu(name: 'CACSA Constitution', bgImage: 'cacsa_constitution' )
    ];
  }
}
