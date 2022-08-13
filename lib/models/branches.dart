class Branch {
  String name;
  String address;

  Branch({
    required this.name,
    required this.address,
  });
}

class BranchState {
  String state;
  Branch headQuarters;
  List<Branch> otherAssemblies;

  BranchState({
    required this.state,
    required this.headQuarters,
    required this.otherAssemblies,
  });
}
