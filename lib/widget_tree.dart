import 'package:firebase_auth/firebase_auth.dart';
import 'package:testproject/auth.dart';
import 'package:testproject/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:testproject/student_dashboard.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);
  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StudentDashboard(user: FirebaseAuth.instance.currentUser);
        } else {
          return const HomePage();
        }
      },
    );
  }
}
