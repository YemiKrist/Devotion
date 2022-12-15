import 'package:cacsa/models/media.dart';

class MediaList {
  static List<Media> getMediaMedium() {
    return [
      Media(icons: "assets/facebook.png", title: "FACEBOOK", route: "settings"),
      Media(icons: "assets/Mask.png", title: "MIXLR", route: "manuals"),
      Media(icons: "assets/youtube.png", title: "YOUTUBE", route: "give"),
      Media(icons: "assets/instagram.png", title: "INSTAGRAM", route: ""),
      Media(icons: "assets/dribble.png", title: "WEBSITE", route: ""),
    ];
  }
}
