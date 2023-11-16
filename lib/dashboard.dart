// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testproject/create_test.dart';
import 'package:testproject/TakeTestPage.dart';
import 'package:testproject/pages/EditProfilePage.dart';

class StudentDashboard extends StatefulWidget {
  final User? user;

  const StudentDashboard({required this.user});

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  String firstName = '';
  String lastName = '';
  bool isTeacher = false;
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
        isTeacher = userDoc.data()?['isTeacher'] ?? false;
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
    // fetchData();
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
                  builder: (context) => EditProfile(user: widget.user),
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
          CreateTest(user: FirebaseAuth.instance.currentUser),
          Home(user: FirebaseAuth.instance.currentUser!),
          TakeTestPage(), // Right page
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
          items: [
            if (isTeacher)
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
          ]),
    );
  }
}

class Home extends StatelessWidget {
  final User user;

  const Home({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> fetchTests() async {
      try {
        final QuerySnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance
                .collection('tests')
                .where('creatorUid', isEqualTo: user.uid)
                .get();

        return snapshot.docs.map((doc) {
          return {
            'title': doc['title'] as String,
            'numberOfQuestions': (doc['questions'] as List<dynamic>).length,
            'submissions': (doc['submissions'] as List<dynamic>),
          };
        }).toList();
      } catch (e) {
        // Handle error
        print('Error fetching tests: $e');
        return [];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchTests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final List<Map<String, dynamic>>? testList = snapshot.data;

          if (testList == null || testList.isEmpty) {
            return Center(child: Text('No tests created yet.'));
          }

          // Display cards for each test
          return ListView.builder(
            itemCount: testList.length,
            itemBuilder: (context, index) {
              final test = testList[index];
              return Card(
                elevation: 4.0,
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(test['title'] as String),
                  subtitle:
                      Text('Number of questions: ${test['numberOfQuestions']}'),
                  onTap: () {
                    showSubmissionDetailsDialog(context, test);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void showSubmissionDetailsDialog(
    BuildContext context, Map<String, dynamic> test) {
  String testTitle = test['title'] ?? 'Unknown Title';
  int numberOfQuestions = test['numberOfQuestions'] ?? 0;
  List<dynamic> submissions = test['submissions'] ?? [];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Submission Details'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Test Title: $testTitle'),
            Text('Number of Questions: $numberOfQuestions'),
            const SizedBox(height: 10.0),
            Text('Submissions:'),
            for (var submission in submissions)
              if (submission != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Taker Name: ${submission['takerName'] ?? 'Unknown Taker'}'),
                    Text('Score: ${submission['score'] ?? 0}'),
                    const SizedBox(height: 10.0),
                  ],
                ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
