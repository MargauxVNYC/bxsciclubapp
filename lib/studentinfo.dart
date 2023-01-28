class StudentInfo {
  String? email;
  String? osis;
  String? password;
  String? firstname;
  String? lastname;
  String? gradyear;

  StudentInfo({
    required this.email,
    required this.osis,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.gradyear,
  });

  static List<StudentInfo> studentInfoList() {
    return [
      StudentInfo(
          email: 'jobs1@bxscience.edu',
          password: 'j9AFBJTG',
          osis: '001001001',
          firstname: 'Steve',
          lastname: 'Jobs',
          gradyear: '2024'),
      StudentInfo(
          email: 'gates@bxscience.edu',
          password: 'NT2vHjyf',
          osis: '002002002',
          firstname: 'Bill',
          lastname: 'Gates',
          gradyear: '2024'),
      StudentInfo(
          email: 'tesla@bxscience.edu',
          password: 'QYu9n9ew',
          osis: '003003003',
          firstname: 'Nikola',
          lastname: 'Tesla',
          gradyear: '2024'),
      StudentInfo(
          email: 'vasilescm@bxscience.edu',
          password: 'eKcwgdbZ',
          osis: '229230743',
          firstname: 'Margaux',
          lastname: "Vasilescu",
          gradyear: '2024'),
    ];
  }
}
