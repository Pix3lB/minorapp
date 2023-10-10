import 'package:flutter/material.dart';

class CreateTest extends StatefulWidget {
  const CreateTest({super.key});

  @override
  _CreateTestState createState() => _CreateTestState();
}

class _CreateTestState extends State<CreateTest> {
  List<QuestionCard> questionCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Test'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 0; i < questionCards.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: questionCards[i],
              ),
            ElevatedButton(
              onPressed: () {
                // Add a new question card
                setState(() {
                  questionCards.add(const QuestionCard());
                });
              },
              child: const Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Question'),
            ),
            const SizedBox(height: 20.0),
            for (int i = 0; i < 4; i++)
              Row(
                children: [
                  Radio(
                    value: i,
                    groupValue: -1,
                    onChanged: null,
                  ),
                  Expanded(
                    child: TextField(
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

void main() {
  runApp(const MaterialApp(home: CreateTest()));
}
