import 'package:flutter/material.dart';
import 'homepage.dart';
import 'login.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

// class UserAcc {
//   String name, email, pass, gradyr, osis;
//   UserAcc(this.name, this.email, this.pass, this.gradyr, this.osis);
// }
