// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testproject/create_test.dart';
import 'package:testproject/take_test.dart';

class StudentDashboard extends StatefulWidget {
  final User? user;

  const StudentDashboard({required this.user});

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  String firstName = '';
  String lastName = '';
  int _currentPage = 1;
  PageController _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  } // Initial page is the home page

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
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Dashboard of $firstName $lastName '),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(user: widget.user),
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: _signOut,
        ),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          CreateTest(), // Left page
          Home(), // Middle page (Home)
          TakeTest(), // Right page
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Create Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Take Test',
          ),
        ],
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
          title: Text('Edit Profile'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Home Page',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
