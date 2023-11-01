// ignore_for_file: camel_case_types, use_build_context_synchronously, unused_element

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

import '../student_dashboard.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerfname = TextEditingController();
  final TextEditingController _controllerlname = TextEditingController();
  bool isTeacher = false;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  StudentDashboard(user: FirebaseAuth.instance.currentUser)));
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.';
        } else {
          errorMessage = 'Error: ${e.code}';
        }
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      createUserProfile(FirebaseAuth.instance.currentUser);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserProfile(user) async {
    String uid = user.uid;
    try {
      await Auth().createUserProfile(
        uid: uid,
        fname: _controllerfname.text,
        lname: _controllerlname.text,
        isTeacher: isTeacher,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget div(height) {
    return SizedBox(height: height * 0.015);
  }

  Widget _title() {
    return const Text("Firebase Auth");
  }

  Widget _entryField(String title, TextEditingController controller,
      {bool isobscure = false}) {
    return TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        obscureText: isobscure,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.blue[50]),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ));
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Oh no! $errorMessage',
        style: const TextStyle(color: Colors.white));
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Text(
          isLogin ? 'Login' : 'Register',
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
          ),
        ));
  }

  Widget _loginOrRegister() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          )),
    );
  }

  Widget registerfield(height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _entryField(
          'First Name',
          _controllerfname,
        ),
        div(height),
        _entryField(
          'Last Name',
          _controllerlname,
        ),
        div(height),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Are you a teacher?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Switch(
                value: isTeacher,
                onChanged: (newValue) {
                  setState(() {
                    isTeacher = newValue;
                  });
                }),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    double width = mQuery.size.width;
    double height = mQuery.size.height;
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(color: Colors.blue[50]),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(.03 * width),
          height: isLogin ? .6 * height : .7 * height,
          width: .6 * width,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.login,
                  size: 100,
                  color: Colors.white,
                ),
                div(height),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _entryField('Email', _controllerEmail),
                    div(height),
                    _entryField('Password', _controllerPassword,
                        isobscure: true),
                    div(height),
                    Visibility(visible: !isLogin, child: registerfield(height)),
                    _loginOrRegister(),
                    div(height),
                    _submitButton(),
                    div(height),
                    _errorMessage(),
                  ],
                ),
              ]),
        ),
      ),
    )));
  }
}
