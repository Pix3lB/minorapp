import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testproject/pages/result.dart';

class TestDisplayPage extends StatelessWidget {
  final String testTitle;
  final List<Map<String, dynamic>> questionsData;
  final List<int?> selectedAnswers;

  TestDisplayPage({
    Key? key,
    required this.testTitle,
    required this.questionsData,
  })  : selectedAnswers = List.generate(questionsData.length, (index) => null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taking test $testTitle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Answer the following questions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: questionsData.length,
                itemBuilder: (context, index) {
                  return QuestionCard(
                    questionNumber: index,
                    questionData: questionsData[index],
                    onAnswerSelected: (selectedAnswer) {
                      selectedAnswers[index] = selectedAnswer;
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                submitTest(questionsData, context);
              },
              child: const Text('Submit'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitTest(List<Map<String, dynamic>> questionsData, context) async {
    try {
      // Calculate the number of correct answers
      int correctAnswers = 0;
      for (int i = 0; i < questionsData.length; i++) {
        if (questionsData[i]['correctAnswer'] == (selectedAnswers[i]!)) {
          correctAnswers++;
        }
      }

      // Prepare the submission data
      Map<String, dynamic> submissionData = {
        'takerName':
            FirebaseAuth.instance.currentUser?.displayName ?? 'Anonymous',
        'score': correctAnswers,
      };

      // Access the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get the test document reference
      QuerySnapshot testDocumentQuery = await firestore
          .collection('tests')
          .where('title', isEqualTo: testTitle)
          .limit(1)
          .get();

      if (testDocumentQuery.docs.isNotEmpty) {
        DocumentReference testDocumentRef =
            testDocumentQuery.docs.first.reference;

        // Update the submissions field in the test document
        await testDocumentRef.update({
          'submissions': FieldValue.arrayUnion([submissionData]),
        });

        // Navigate to the result page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              questionsData: questionsData,
              selectedAnswers: selectedAnswers,
            ),
          ),
        );
      } else {
        // Handle the case where the test document is not found
        print('Test document not found');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Incomplete Test'),
            content:
                const Text('Please attempt all questions before submitting.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

class QuestionCard extends StatefulWidget {
  final int questionNumber;
  final Map<String, dynamic> questionData;
  final ValueChanged<int?> onAnswerSelected;

  const QuestionCard({
    Key? key,
    required this.questionNumber,
    required this.questionData,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int? selectedAnswer;

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
            Text(
              'Question ${widget.questionNumber + 1}:  ${widget.questionData['text']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            for (int i = 0; i < widget.questionData['options'].length; i++)
              Row(
                children: [
                  Radio(
                    value: i,
                    groupValue: selectedAnswer,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value as int?;
                        widget.onAnswerSelected(selectedAnswer);
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      '${String.fromCharCode(65 + i)}. ${widget.questionData['options'][i]}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
