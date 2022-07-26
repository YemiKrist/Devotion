import 'package:cacsa/models/event.dart';

class EventsList {
  static List<Event> getEvents() {
    return [
      Event(
          month: "June",
          week: "1st Week",
          dates: "3RD - 4TH",
          title: "Pentecostal Wonder Night\nUshers Seminar"),
      //Event(month: §, week: week, dates: dates, title: title)
    ];
  }
}
