import 'package:flutter/material.dart';
import 'package:testproject/tdash_board.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late MediaQueryData _mediaQuery;

  @override
  Widget build(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Center(
        child: Container(
          width: _mediaQuery.size.width,
          height: _mediaQuery.size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.greenAccent],
            ),
          ),
          child: Column(
            children: <Widget>[
              const Text(
                'Online Exam Portal',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              SizedBox(height: _mediaQuery.size.height * 0.03),
              const Text(
                'LOGIN',
                style: TextStyle(color: Colors.yellow, fontSize: 30),
              ),
              SizedBox(height: _mediaQuery.size.height * 0.08),
              buildLoginForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Row(
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
                margin: const EdgeInsets.all(1),
                height: _mediaQuery.size.height * 0.5,
                width: _mediaQuery.size.width * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/student_login.png'),
                  ),
                ),
              ),
              SizedBox(width: _mediaQuery.size.width * 0.05),
              buildLoginFields(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLoginFields() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: _mediaQuery.size.height * 0.03),
        buildTextField('Email Address', Colors.black, 0.2),
        SizedBox(height: _mediaQuery.size.height * 0.03),
        buildTextField('Password', Colors.black, 0.2),
        SizedBox(height: _mediaQuery.size.height * 0.03),
        buildLoginButton(),
      ],
    );
  }

  Widget buildTextField(String hintText, Color hintColor, double widthFactor) {
    return SizedBox(
      width: _mediaQuery.size.width * widthFactor,
      child: TextField(
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return SizedBox(
      width: _mediaQuery.size.width * 0.09,
      height: _mediaQuery.size.height * 0.04,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeacherDashboard(),
              ));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
