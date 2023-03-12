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

class HigherInstitution {
  String name;
  String address;

  HigherInstitution({required this.name, required this.address});
}

class HigherInstitutionByState {
  String state;
  List<HigherInstitution> fellowships;

  HigherInstitutionByState({required this.state, required this.fellowships});
}
