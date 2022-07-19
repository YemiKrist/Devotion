class Devotion {
  String title;
  String read;
  String memoryVerse;
  String introduction;
  String content;
  String climax;
  String reflection;
  String conclusion;
  List<String> prayerPoint;

  Devotion(
      {required this.title,
      required this.read,
      required this.memoryVerse,
      required this.introduction,
      required this.content,
      required this.climax,
      required this.reflection,
      required this.conclusion,
      required this.prayerPoint});
}

class Walk {
  String topic;
  String month;
  String date;
  String id;
  Devotion devotion;

  Walk(
      {required this.id,
      required this.month,
      required this.date,
      required this.topic,
      required this.devotion});
}
