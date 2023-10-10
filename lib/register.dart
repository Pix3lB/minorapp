import 'package:flutter/material.dart';
import 'package:testproject/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Center(
            child: Container(
                width: _mediaQuery.size.width,
                height: _mediaQuery.size.height,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blue, Colors.greenAccent])),
                child: Stack(children: [
                  Center(
                    child: Container(
                      width: _mediaQuery.size.width * 0.4,
                      height: _mediaQuery.size.height * 0.9,
                      margin: EdgeInsets.all(100),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Colors.greenAccent, Colors.blue])),
                      child: Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            'Create!!',
                            style: TextStyle(
                                fontSize: _mediaQuery.size.width * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: _mediaQuery.size.height * 0.03,
                        ),
                        Container(
                            width: _mediaQuery.size.width * 0.3,
                            child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.abc_rounded,
                                      color: Color.fromARGB(255, 28, 26, 26),
                                    ),
                                    hintText: 'First Name',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    )))),
                        SizedBox(
                          height: _mediaQuery.size.height * 0.03,
                        ),
                        Container(
                          //margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: _mediaQuery.size.width * 0.3,
                                  child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.abc_rounded,
                                            color:
                                                Color.fromARGB(255, 28, 26, 26),
                                          ),
                                          hintText: 'Last Name',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ))))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _mediaQuery.size.height * 0.03,
                        ),
                        Container(
                          //margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: _mediaQuery.size.width * 0.3,
                                  child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.person,
                                            color:
                                                Color.fromARGB(255, 28, 26, 26),
                                          ),
                                          hintText: 'Username',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ))))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _mediaQuery.size.height * 0.05,
                        ),
                        Container(
                          //margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: _mediaQuery.size.width * 0.3,
                                  child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.mail,
                                            color:
                                                Color.fromARGB(255, 28, 26, 26),
                                          ),
                                          hintText: 'Email Address',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ))))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _mediaQuery.size.height * 0.05,
                        ),
                        Container(
                          //margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: _mediaQuery.size.width * 0.3,
                                  child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.lock,
                                            color:
                                                Color.fromARGB(255, 28, 26, 26),
                                          ),
                                          hintText: 'Password',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ))))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _mediaQuery.size.height * 0.05,
                        ),
                        Container(
                          //margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: _mediaQuery.size.width * 0.3,
                                  child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.lock,
                                            color:
                                                Color.fromARGB(255, 28, 26, 26),
                                          ),
                                          hintText: 'Confirm Password',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ))))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: _mediaQuery.size.height * 0.05,
                        ),
                        Container(
                          width: _mediaQuery.size.width * 0.2,
                          height: _mediaQuery.size.height * 0.045,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Login()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )),
                        )
                      ]),
                    ),
                  )
                ]))));
  }
}
