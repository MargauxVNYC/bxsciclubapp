import 'package:bxsciclubapp/homepage.dart';
import 'package:flutter/material.dart';
import 'teacherinfo.dart';
import 'colors.dart';
import 'homepage.dart';

class NewTeacher extends StatefulWidget {
  NewTeacher({Key? key}) : super(key: key);

  @override
  State<NewTeacher> createState() => NewTeacherState();
}

class NewTeacherState extends State<NewTeacher> {
  final infoList = TeacherInfo.teacherInfoList();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final clubadvisingController = TextEditingController();

  Widget build(BuildContext elements) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: beaublue,
          iconTheme: IconThemeData(color: Colors.black),
          title: const Text('Create Advisor Account',
              style: TextStyle(color: Colors.black)),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: 25, left: 8.0, right: 8.0, bottom: 20.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25, left: 8.0, right: 8.0, bottom: 20.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25, left: 8.0, right: 8.0, bottom: 20.0),
              child: TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'First Name',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25, left: 8.0, right: 8.0, bottom: 20.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Last Name',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25, left: 8.0, right: 8.0, bottom: 20.0),
              child: TextField(
                controller: clubadvisingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Club Advising',
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: xanadu, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  addField(
                      emailController.text,
                      passwordController.text,
                      firstNameController.text,
                      lastNameController.text,
                      clubadvisingController.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HomePage())); //connects to next page
                },
                child: Text(
                  'Create',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        )));
  }

  void addField(String _email, String _password, String _firstname, String _lastname, String _clubAdvising) {
    setState(() {
      infoList.add(TeacherInfo(
          email: _email,
          password: _password,
          firstname: _firstname,
          lastname: _lastname,
          clubadvising: _clubAdvising));
    });
    emailController.clear();
    passwordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    clubadvisingController.clear();
  }
  
}
