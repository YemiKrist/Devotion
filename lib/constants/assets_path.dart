const String imageAssetRoot = "assets/";

final String splashLogo = _getImagePath("logo.png");
final String thinkTech = _getImagePath("thinkTech.png");
final String creditCard = _getImagePath("credit-card.png");
final String successCheck = _getImagePath("check.png");
final String manualsIcon = _getImagePath("icons/manual.png");
final String arrowIcon = _getImagePath("icons/arrow.png");
final String hamBurger = _getImagePath("icons/Hambuger.png");
// final String dailyWalk = _getImagePath("daily_walk.png");
// final String cacsaConstitution = _getImagePath("cacsa_constitution.png");
// final String workersManual = _getImagePath("workers_manual.png");
// final String believersClass = _getImagePath("believers_class.png");

String _getImagePath(String imageName) => imageAssetRoot + imageName;
