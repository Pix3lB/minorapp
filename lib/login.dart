import 'package:flutter/material.dart';
import 'student_dashboard.dart';
import 'teacher_dashboard.dart';

class LoginAsStudent extends StatefulWidget {
  const LoginAsStudent({super.key});

  @override
  State<LoginAsStudent> createState() => _LoginAsStudentState();
}

class _LoginAsStudentState extends State<LoginAsStudent> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 36, 65, 116),
      body: Center(
          child: Container(
        width: _mediaQuery.size.width,
        height: _mediaQuery.size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.greenAccent])),
        child: Column(
          children: <Widget>[
            Container(
                child: const Text(
              'Online Exam Portal',
              style: TextStyle(color: Colors.white, fontSize: 50),
            )),
            SizedBox(
              height: _mediaQuery.size.height * 0.03,
            ),
            Container(
              child: const Text('STUDENT LOGIN!',
                  style: TextStyle(color: Colors.yellow, fontSize: 30)),
            ),
            SizedBox(
              height: _mediaQuery.size.height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: _mediaQuery.size.height * 0.5,
                  width: _mediaQuery.size.width * 0.8,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(1),
                        height: _mediaQuery.size.height * 0.5,
                        width: _mediaQuery.size.width * 0.5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/student_login.png'))),
                      ),
                      SizedBox(
                        width: _mediaQuery.size.width * 0.05,
                      ),
                      Container(
                        //margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: _mediaQuery.size.width * 0.2,
                                child: TextField(
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: 'Email Address',
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 91, 83, 83)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )))),
                            SizedBox(
                              height: _mediaQuery.size.height * 0.03,
                            ),
                            Container(
                                width: _mediaQuery.size.width * 0.2,
                                child: TextField(
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 91, 83, 83)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )))),
                            SizedBox(
                              height: _mediaQuery.size.height * 0.03,
                            ),
                            Container(
                              width: _mediaQuery.size.width * 0.09,
                              height: _mediaQuery.size.height * 0.04,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StudentDashboardApp()));
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

class LoginAsTeacher extends StatefulWidget {
  const LoginAsTeacher({super.key});

  @override
  State<LoginAsTeacher> createState() => _LoginAsTeacherState();
}

class _LoginAsTeacherState extends State<LoginAsTeacher> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 36, 65, 116),
      body: Center(
          child: Container(
        width: _mediaQuery.size.width,
        height: _mediaQuery.size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.greenAccent])),
        child: Column(
          children: <Widget>[
            Container(
                child: const Text(
              'Online Exam Portal',
              style: TextStyle(color: Colors.white, fontSize: 50),
            )),
            SizedBox(
              height: _mediaQuery.size.height * 0.03,
            ),
            Container(
              child: const Text('TEACHER LOGIN!',
                  style: TextStyle(color: Colors.yellow, fontSize: 30)),
            ),
            SizedBox(
              height: _mediaQuery.size.height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: _mediaQuery.size.height * 0.5,
                  width: _mediaQuery.size.width * 0.8,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(1),
                        height: _mediaQuery.size.height * 0.5,
                        width: _mediaQuery.size.width * 0.5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/student_login.png'))),
                      ),
                      SizedBox(
                        width: _mediaQuery.size.width * 0.05,
                      ),
                      Container(
                        //margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: _mediaQuery.size.width * 0.2,
                                child: TextField(
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: 'Email Address',
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 91, 83, 83)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )))),
                            SizedBox(
                              height: _mediaQuery.size.height * 0.03,
                            ),
                            Container(
                                width: _mediaQuery.size.width * 0.2,
                                child: TextField(
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 91, 83, 83)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )))),
                            SizedBox(
                              height: _mediaQuery.size.height * 0.03,
                            ),
                            Container(
                              width: _mediaQuery.size.width * 0.09,
                              height: _mediaQuery.size.height * 0.04,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()));
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
