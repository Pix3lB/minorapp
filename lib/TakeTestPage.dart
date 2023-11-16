import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './pages/testdisplay.dart'; // Import your TestDisplay page

class TakeTestPage extends StatefulWidget {
  const TakeTestPage({Key? key}) : super(key: key);

  @override
  _TakeTestPageState createState() => _TakeTestPageState();
}

class _TakeTestPageState extends State<TakeTestPage> {
  String testName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Enter Test Name:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  testName = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Enter the test name',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                fetchAndDisplayTest();
              },
              child: const Text('Take Test'),
            ),
          ],
        ),
      ),
    );
  }

  void fetchAndDisplayTest() async {
    if (testName.isEmpty) {
      // todo:error message
      return;
    }

    try {
      // Access the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query for the test with the specified name
      QuerySnapshot testQuery = await firestore
          .collection('tests')
          .where('title', isEqualTo: testName)
          .get();

      // Check if the test exists
      if (testQuery.docs.isNotEmpty) {
        // Get the first document (assuming there's only one test with the given name)
        DocumentSnapshot testDocument = testQuery.docs.first;

        // Extract test data
        String testTitle = testDocument['title'];
        List<dynamic> questionsData = testDocument['questions'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TestDisplayPage(
              testTitle: testTitle,
              questionsData: questionsData.cast<Map<String, dynamic>>(),
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Test Not Found'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Error fetching and displaying test: $e');
    }
  }
}
