import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testproject/pages/home.dart';

class StudentDashboard extends StatefulWidget {
  final User? user;

  StudentDashboard({required this.user});

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  String firstName = '';
  String lastName = '';
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.user?.uid)
        .get();
    if (userDoc.exists) {
      setState(() {
        firstName = userDoc.data()?['fname'] ?? '';
        lastName = userDoc.data()?['lname'] ?? '';
      });
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Good day $firstName $lastName'),
            Text('Email: ${widget.user?.email}'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Edit Profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(user: widget.user),
                  ),
                );
              },
              child: const Text('Edit Profile'),
            ),
            ElevatedButton(
              onPressed: _signOut, // Call the sign-out method
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  final User? user;

  const EditProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
