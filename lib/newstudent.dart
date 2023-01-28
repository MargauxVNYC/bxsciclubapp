import 'package:flutter/material.dart';
import 'main.dart';
import 'studentinfo.dart';
import 'colors.dart';
import 'homepage.dart';

// List<String> clubs = <String>['Club 1', 'Club 2', 'Club 3', 'Club 4'];

class NewStudent extends StatefulWidget {
  NewStudent({Key? key}) : super(key: key);

  @override
  State<NewStudent> createState() => NewStudentState();
}

class NewStudentState extends State<NewStudent> {
  final infoList = StudentInfo.studentInfoList();
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final osisController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final graduatingYearController = TextEditingController();

  Widget build(BuildContext elements) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: beaublue,
          iconTheme: IconThemeData(color: Colors.black),
          title: const Text('Create Student Account',
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
                controller: osisController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Osis',
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
                controller: lastNameController,
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
                controller: graduatingYearController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Graduating Year',
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
                      osisController.text,
                      firstNameController.text,
                      lastNameController.text,
                      graduatingYearController.text);
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
        )) 
        );
  }

  void addField(String _email, String _password, String _osis,
      String _firstname, String _lastname, String _gradYear) {
    setState(() {
      infoList.add(StudentInfo(
          email: _email,
          password: _password,
          osis: _osis,
          firstname: _firstname,
          lastname: _lastname,
          gradyear: _gradYear));
    });
    emailController.clear();
    passwordController.clear();
    osisController.clear();
    firstNameController.clear();
    lastNameController.clear();
    graduatingYearController.clear();
  }
}

// ListTile _tile(String hint) {
//   return ListTile(
//       title: TextField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             hintText: hint,
//             border: InputBorder.none,
//           )));
// }

// ListTile _clubselect extends DropDo(){
//   String dropdownValue = clubs.first;
//   return DropdownButton<String>(
//     value: dropdownValue,
//     icon: const Icon(Icons.arrow_drop_down),
//     elevation: 16,
//     style: const TextStyle(color: Colors.black)
//     onChanged: (String? value){
//       setState(() {
//         dropdownvalue = value!;
//       });
//     },
//     items: clubs.map<DropdownMenuItem<String>>((String value) {
//       return DropdownMenuItem(
//         value: value,
//         child: Text(value),
//       );
//     }).toList(),
//   );
// }
