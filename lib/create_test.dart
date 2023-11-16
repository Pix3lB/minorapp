// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateTest extends StatefulWidget {
  final User? user;

  const CreateTest({Key? key, this.user}) : super(key: key);

  @override
  _CreateTestState createState() => _CreateTestState();
}

class _CreateTestState extends State<CreateTest> {
  String testName = '';
  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Test Name:'),
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
                setState(() {
                  questions.add(Question());
                });
              },
              child: const Text('Add Question'),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return QuestionCard(
                    question: questions[index],
                    onQuestionChanged: (newQuestion) {
                      setState(() {
                        questions[index] = newQuestion;
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                saveTestToFirestore();
              },
              child: const Text('Save Test'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveTestToFirestore() {
    if (testName.isEmpty) {
      // Show AlertDialog for empty test name
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter a test name.'),
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
    } else {
      // Save the test to Firestore
      saveTestToFirestoreFunction(Test(
        title: testName,
        questions: questions,
        creatorUid: widget.user?.uid ?? '',
      ));
    }
  }

  void saveTestToFirestoreFunction(Test test) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      print('User UID: ${widget.user?.uid}');
      DocumentReference testDocumentRef =
          await firestore.collection('tests').add({
        'creatorUid': test.creatorUid,
        'title': test.title,
        'questions': test.questions
            .map((question) => {
                  'text': question.questionText,
                  'options': question.options,
                  'correctAnswer': question.correctOptionIndex,
                })
            .toList(),
        'submissions': [],
      });

      // Show success AlertDialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Test Published'),
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
    } catch (e) {
      print('Error saving test to Firestore: $e');
    }
  }
}

class Question {
  String questionText = '';
  List<String> options = List.generate(4, (index) => '');
  int correctOptionIndex = -1; // -1 means no correct option selected
}

class QuestionCard extends StatefulWidget {
  final Question question;
  final ValueChanged<Question> onQuestionChanged;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.onQuestionChanged,
  }) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                widget.question.questionText = value;
                widget.onQuestionChanged(widget.question);
              },
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            const SizedBox(height: 20.0),
            for (int i = 0; i < 4; i++)
              Row(
                children: [
                  Radio(
                    value: i,
                    groupValue: widget.question.correctOptionIndex,
                    onChanged: (value) {
                      setState(() {
                        widget.question.correctOptionIndex = value as int;
                        widget.onQuestionChanged(widget.question);
                      });
                    },
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        widget.question.options[i] = value;
                        widget.onQuestionChanged(widget.question);
                      },
                      decoration: InputDecoration(
                        labelText: 'Option ${i + 1}',
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class Test {
  String title;
  List<Question> questions;
  String creatorUid; // New field to store the creator's UID

  Test({
    required this.title,
    required this.questions,
    required this.creatorUid,
  });

  @override
  String toString() {
    return 'Test(title: $title, questions: $questions, creatorUid: $creatorUid)';
  }
}
