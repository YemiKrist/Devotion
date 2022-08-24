import '../models/accounts.dart';

class AccountDetails {
  static List<Accounts> getAccountDetails() {
    return [
      Accounts(
          accountNumber: "2036055791",
          accountName: "Christ Apostolic Church\nStudents' Association",
          bankName: "First Bank"),
      Accounts(
          accountNumber: "0037882708",
          accountName: "CACSA Ministers' Welfare",
          bankName: "Union Bank"),
      Accounts(
          accountNumber: "2013919810",
          accountName: "Christ Apostolic Church\nStudents' Association",
          bankName: "Union Bank")
    ];
  }
}
