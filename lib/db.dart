import 'dart:io';
import 'dart:convert';
import 'main.dart';
import 'package:postgres/postgres.dart';

class DB {
  late Future<List<Users>> students;
  late Future<List<Users>> teachers;
  late Future<List<Club>> clubs;
// Future<PostgreSQLConnection> getConnection() async {
  //   final conn = PostgreSQLConnection(
  //     'localhost',
  //     5432,
  //     'postgres',
  //     username: 'postgres',
  //     password: 'password',
  //   );
  //   await conn.open();
  //   return conn;
//     }
  Future operation() async {
    var connection = PostgreSQLConnection(
        "dpg-cf5a12da4992g5gsf2hg-a.oregon-postgres.render.com",
        5432,
        'postgresql_pgadmin_vtsq',
        username: 'postgresql_pgadmin_vtsq_user',
        password: 'bAFbFzdYULKkLEMkZij6rCAoPVhYIEDr');
    await connection.open();
// var studentresults = await connection.query('SELECT * from student_users');
//   print(studentresults);
//   for (var row in studentresults) {
//     students.add(Student_User(row[0], row[1], row[2], row[3], row[4], row[5]));
//   }
// }
// var teacherresults = await connection.query('SELECT * from student_users');
    students = getAllStudents(connection);
    teachers = getAllTeachers(connection);
    clubs = getAllClubs(connection);
  }

  // Future<PostgreSQLConnection> getConnection() async {
  //   final conn = PostgreSQLConnection(
  //     'localhost',
  //     5432,
  //     'postgres',
  //     username: 'postgres',
  //     password: 'password',
  //   );
  //   await conn.open();
  //   return conn;
  // }

  Future<List<Student_User>> getAllStudents(PostgreSQLConnection conn) async {
    List<Student_User> allUsers = [];
    var results = await conn.query('SELECT * from student_users');
    print(results);
    for (var row in results) {
      allUsers
          .add(Student_User(row[0], row[1], row[2], row[3], row[4], row[5]));
      print(allUsers);
    }
    return allUsers;
  }

  Future<List<Users>> getAllTeachers(PostgreSQLConnection conn) async {
    List<Users> allUsers = [];

    var results = await conn.query('SELECT * from student_users');
    print(results);
    for (var row in results) {
      allUsers.add(Users(row[0], row[1], row[2], row[3]));
      print(allUsers);
    }
    return allUsers;
  }

  Future<List<Club>> getAllClubs(PostgreSQLConnection conn) async {
    List<Club> allClubs = [];

    var results = await conn.query('SELECT * from student_users');
    print(results);
    for (var row in results) {
      allClubs.add(Club(row[2], row[3], row[4], row[5], row[6], row[7], row[8],
          row[9], row[10], row[11], row[12], row[13], row[14], row[15]));
    }
    return allClubs;
  }
}

Future<bool> login(PostgreSQLConnection conn, email, secret) async {
  var accs = <String>[];
  print('email:  $email');
  var results = await conn
      .query("SELECT secret from student_users where email = '$email'");
  for (var row in results) {
    accs.add(row[0]);
    print('password : ${row[0]}');
  }
  var results2 = await conn
      .query("SELECT secret from teacher_users where email = '$email'");
  for (var row in results2) {
    accs.add(row[0]);
  }
  conn.close();
  // return accs;
  if (accs.contains(secret)) {
    return true;
  }
  return false;
}

Future<void> createNewStudentUser(
    PostgreSQLConnection conn,
    String First_Name,
    String Last_Name,
    String email,
    String osis,
    String secret,
    String grad_year) async {
  await conn.query('''
      INSERT INTO student_users (First_Name, Last_Name, email, osis, secret, grad_year)
      VALUES ("$First_Name", "$Last_Name", "$email", "$osis", "$secret", "$grad_year")
    ''');
}

Future<void> createNewTeacherUser(
    PostgreSQLConnection conn, First_Name, Last_Name, email, secret) async {
  await conn.query('''
      INSERT INTO teacher_users (First_Name, Last_Name, email, secret)
      VALUES ("$First_Name", "$Last_Name", "$email", "$secret")
    ''');
}

class Users {
  String First_Name, Last_Name, email, secret;
  List<String> allEmails = [];
  Users(this.First_Name, this.Last_Name, this.email, this.secret);
}

class Student_User extends Users {
  Student_User(String First_Name, String Last_Name, String email, String osis,
      String secret, String grad_year)
      : super(First_Name, Last_Name, email, osis);
}

class Club {
  String Club_Name,
      Days,
      Room,
      Presidents_First_Name,
      Presidents_Last_Name,
      Presidents_Bronx_Science_Email,
      CoPresidentVice_Presidents_First_Name,
      CoPresidentVice_Presidents_Last_Name,
      CoPresidentsVice_Presidents_Bronx_Science_Email,
      Secretarys_First_Name,
      Secretarys_Last_Name,
      Secretarys_Bronx_Science_Email,
      Advisor_Names,
      Advisors_Bronx_Science_Emails;
  Club(
    this.Club_Name,
    this.Days,
    this.Room,
    this.Presidents_First_Name,
    this.Presidents_Last_Name,
    this.Presidents_Bronx_Science_Email,
    this.CoPresidentVice_Presidents_First_Name,
    this.CoPresidentVice_Presidents_Last_Name,
    this.CoPresidentsVice_Presidents_Bronx_Science_Email,
    this.Secretarys_First_Name,
    this.Secretarys_Last_Name,
    this.Secretarys_Bronx_Science_Email,
    this.Advisor_Names,
    this.Advisors_Bronx_Science_Emails,
  );
}
