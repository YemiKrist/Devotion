import '../models/branches.dart';

class BranchLocations {
  static List<BranchState> getBranches() {
    return [
      BranchState(
          state: "Ekiti State",
          headQuarters: Branch(
              name: "CACSA Goodnews Assembly",
              address: "24, Majaro Street, Pero Bus Stop, Agege, Lagos State"),
          otherAssemblies: [
            Branch(
                name: "CACSA Goodnews Assembly",
                address:
                    "24, Majaro Street, Pero Bus Stop, Agege, Lagos State"),
            Branch(
                name: "CACSA Goodnews Assembly",
                address:
                    "24, Majaro Street, Pero Bus Stop, Agege, Lagos State"),
            Branch(
                name: "CACSA Goodnews Assembly",
                address:
                    "24, Majaro Street, Pero Bus Stop, Agege, Lagos State"),
            Branch(
                name: "CACSA Goodnews Assembly",
                address:
                    "24, Majaro Street, Pero Bus Stop, Agege, Lagos State"),
            Branch(
                name: "CACSA Goodnews Assembly",
                address:
                    "24, Majaro Street, Pero Bus Stop, Agege, Lagos State"),
            Branch(
                name: "CACSA Goodnews Assembly",
                address:
                    "24, Majaro Street, Pero Bus Stop, Agege, Lagos State"),
          ]),
      BranchState(
          state: "Lagos State",
          headQuarters: Branch(name: "", address: ""),
          otherAssemblies: []),
      BranchState(
          state: "Ogun State",
          headQuarters: Branch(name: "", address: ""),
          otherAssemblies: []),
      BranchState(
          state: "Ondo State",
          headQuarters: Branch(name: "", address: ""),
          otherAssemblies: []),
      BranchState(
          state: "Osun State",
          headQuarters: Branch(name: "", address: ""),
          otherAssemblies: []),
      BranchState(
          state: "Oyo State",
          headQuarters: Branch(name: "", address: ""),
          otherAssemblies: []),
      BranchState(
          state: "FCT & Northern States",
          headQuarters: Branch(name: "", address: ""),
          otherAssemblies: []),
      BranchState(
          state: "Mission Field",
          headQuarters: Branch(name: "", address: ""),
          otherAssemblies: [])
    ];
  }
}
