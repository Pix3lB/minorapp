import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testproject/pages/home.dart';

class StudentDashboard extends StatefulWidget {
  final User? user;

  const StudentDashboard({required this.user});

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  String firstName = ''; // Initialize with an empty string

  // Future<void> fetchData() async {
  //   try {
  //     String userId = FirebaseAuth.instance.currentUser!.uid;
  //     DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
  //         .instance
  //         .collection('users')
  //         .doc(userId)
  //         .get();

  //     if (snapshot.exists) {
  //       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  //       setState(() {
  //         firstName = data['fname'];
  //       });
  //     } else {
  //       print('User document does not exist.');
  //     }
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // fetchData(); // Fetch data when the widget is initialized
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
            Text('First Name: $firstName'),
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
          children: <Widget>[
            // Add input fields and buttons to edit the user's profile
            // For example, you can allow the user to change their name, email, or other information here.
          ],
        ),
      ),
    );
  }
}
