import 'package:cacsa/models/media.dart';

class MediaList {
  static List<Media> getMediaMedium() {
    return [
      Media(icons: "assets/facebook.png", title: "FACEBOOK", route: "https://m.facebook.com/1187002744772922/"),
      Media(icons: "assets/Mask.png", title: "MIXLR", route: "https://m.youtube.com/@cacsagroup1589"),
      Media(icons: "assets/youtube.png", title: "YOUTUBE", route: "https://m.youtube.com/@cacsagroup1589"),
      Media(icons: "assets/instagram.png", title: "INSTAGRAM", route: "www.instagram.com/cacsaofficial"),   
      Media(icons: "assets/dribble.png", title: "WEBSITE", route: "www.cacsa.org"),
    ];
  }
}
