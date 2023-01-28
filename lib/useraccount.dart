import 'newstudent.dart';
import 'newteacher.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class NewAccount extends StatefulWidget {
  NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => NewAccountState();
}

class NewAccountState extends State<NewAccount> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: beaublue,
      appBar: AppBar(
        backgroundColor: beaublue,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
  
      child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 250.0, bottom: 20),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: xanadu,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NewStudent()));
              },
              child: Text(
                'Student',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: xanadu,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NewTeacher()));
          },
          child: Text(
            'Teacher',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    ])));
  }
}
