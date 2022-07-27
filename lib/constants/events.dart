import 'package:cacsa/models/event.dart';

class EventsList {
  static List<Event> getEvents() {
    return [
      Event(
          month: "June",
          week: "1st Week",
          dates: "3RD - 4TH",
          title: "Pentecostal Wonder Night\nUshers Seminar"),
      Event(month: "June", week: "2nd week", dates: "", title: ""),
      Event(
          month: "June",
          week: "3rd week",
          dates: "3RD - 4TH",
          title: "Teens and childrens teacher seminar\nchoir congress"),
      Event(month: "June", week: "2nd week", dates: "", title: ""),
    ];
  }
}
