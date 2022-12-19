class Outline {
  String topic;
  List<String> body;

  Outline({required this.topic, required this.body});
}

class Discussion {
  int id;
  String body;

  Discussion({required this.id, required this.body});
}

class Study {
  int id;
  String topic;
  String memoryVerse;
  String text;
  String introduction;
  List<Outline> studyOutline;
  String conclusion;
  List<Discussion> discussion;

  Study({
    required this.id,
    required this.topic,
    required this.text,
    required this.memoryVerse,
    required this.introduction,
    required this.studyOutline,
    required this.conclusion,
    required this.discussion,
  });
}
