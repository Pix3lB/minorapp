// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const firstpage(),
    );
  }
}

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryvar = MediaQuery.of(context);

    return Scaffold(
      body: Center(
        child: Container(
            width: mediaQueryvar.size.width,
            height: mediaQueryvar.size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.greenAccent])),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: mediaQueryvar.size.width * 0.9,
                    height: mediaQueryvar.size.height * 0.8,
                    margin: const EdgeInsets.all(100),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.greenAccent, Colors.blue])),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: mediaQueryvar.size.width * 0.5,
                              height: mediaQueryvar.size.height * 0.4,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/firstpage.png'),
                              ))),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: mediaQueryvar.size.height * 0.1,
                              ),
                              SizedBox(
                                height: mediaQueryvar.size.height * 0.1,
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Text(
                                  'Welcome',
                                  style: TextStyle(
                                      fontSize: mediaQueryvar.size.width * 0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Text(
                                  'To Our',
                                  style: TextStyle(
                                      fontSize: mediaQueryvar.size.width * 0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Text(
                                  'Online Test Platform',
                                  style: TextStyle(
                                      fontSize: mediaQueryvar.size.width * 0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: mediaQueryvar.size.height * 0.01,
                              ),
                              Container(
                                margin: const EdgeInsets.all(4),
                                child: Text(
                                  'You are welcome to our new \n Online Test Platform which will\n help you to conduct examination\n',
                                  style: TextStyle(
                                      fontSize:
                                          mediaQueryvar.size.width * 0.015,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: mediaQueryvar.size.height * 0.01,
                              ),
                              SizedBox(
                                height: mediaQueryvar.size.height * 0.01,
                              ),
                              SizedBox(
                                width: mediaQueryvar.size.width * 0.17,
                                height: mediaQueryvar.size.height * 0.04,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Homepage()));
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20)))),
                                    child: const Text(
                                      'Get Started',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryvar = MediaQuery.of(context);

    return Scaffold(
        //backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Web-Based Examination Portal'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            width: mediaQueryvar.size.width,
            height: mediaQueryvar.size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.greenAccent])),
            child: SizedBox(
                width: 430,
                height: 300,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginStu()));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            child: const Text(
                              'As a Student',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginTeacher()));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            child: const Text(
                              'As a Teacher',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                )),
          ),
        ));
  }
}

class LoginStu extends StatefulWidget {
  const LoginStu({super.key});

  @override
  State<LoginStu> createState() => _LoginStuState();
}

class _LoginStuState extends State<LoginStu> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryvar = MediaQuery.of(context);

    return Scaffold(
        //backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Web-Based Examination Portal'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            width: mediaQueryvar.size.width,
            height: mediaQueryvar.size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.greenAccent])),
            child: SizedBox(
                width: 430,
                height: 300,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Register()));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                )),
          ),
        ));
  }
}

class LoginTeacher extends StatefulWidget {
  const LoginTeacher({super.key});

  @override
  State<LoginTeacher> createState() => _LoginTeacherState();
}

class _LoginTeacherState extends State<LoginTeacher> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryvar = MediaQuery.of(context);

    return Scaffold(
        //backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Web-Based Examination Portal'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            width: mediaQueryvar.size.width,
            height: mediaQueryvar.size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.greenAccent])),
            child: SizedBox(
                width: 430,
                height: 300,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Register()));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                )),
          ),
        ));
  }
}
