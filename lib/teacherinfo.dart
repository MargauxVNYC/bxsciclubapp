class TeacherInfo {
  String? email;
  String? password;
  String? firstname;
  String? lastname;
  String? clubadvising;

  TeacherInfo({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.clubadvising,
  });

  static List<TeacherInfo> teacherInfoList() {
    return [
      TeacherInfo(
          email: 'einstein@bxscience.edu',
          password: 'e=mc^2',
          firstname: 'Albert',
          lastname: 'Einstein',
          clubadvising: 'Scioly'),
    ];
  }
}
