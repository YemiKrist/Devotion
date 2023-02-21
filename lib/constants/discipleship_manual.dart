import 'package:cacsa/models/believers_class.dart';

class BelieversClassList {
  static List<Class> getList() {
    return [
      Class(number: 'Zero', topic: 'preface'),
      Class(number: 'One', topic: 'Salvation and the Lordship of Christ'),
      Class(number: 'Two', topic: 'Discovering your new self'),
      Class(number: 'Three', topic: 'Assurance of salvation'),
      Class(number: 'Four', topic: 'Quite time'),
      Class(number: 'Five', topic: 'Holy Spirit Baptism'),
      Class(
          number: 'Six', topic: 'Present state and blessing as a child of God'),
      Class(number: 'Seven', topic: 'Overcoming Temptation'),
      Class(number: 'Eight', topic: 'Witnessing'),
      Class(number: 'Nine', topic: 'Holy Communion'),
      Class(number: 'Ten', topic: 'Christian Discipline'),
      Class(number: 'Eleven', topic: 'Tithes and Offering'),
      Class(number: 'Twelve', topic: 'Trial of faith')
    ];
  }
}

class WorkersMaualList {
  static List<Class> getList() {
    return [
      Class(number: 'FOREWARD', topic: 'Forward'),
      // Class(number: 'PREFACE', topic: 'Preface'),
      Class(number: 'ONE', topic: 'Workers’ Guide'),
      Class(number: 'TWO', topic: 'Ministers’ Code of Conduct'),
      Class(
          number: 'THREE',
          topic:
              'Promotion Arrangement for CACSA Ministerial and Non-Ministerial Officers'),
      Class(number: 'FOUR', topic: 'Church Policy Guidelines'),
      Class(number: 'FIVE', topic: 'Financial Matters'),
      Class(number: 'SIX', topic: 'Marriage Policy Guideline'),
    ];
  }
}
