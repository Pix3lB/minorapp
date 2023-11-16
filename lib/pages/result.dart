import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final List<Map<String, dynamic>> questionsData;
  final List<int?> selectedAnswers;

  ResultPage({
    Key? key,
    required this.questionsData,
    required this.selectedAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int correctAnswersCount = 0;

    for (int i = 0; i < questionsData.length; i++) {
      if (questionsData[i]['correctAnswer'] == selectedAnswers[i]) {
        correctAnswersCount++;
      }
    }

    double attemptPercentage =
        (correctAnswersCount / questionsData.length) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Score: $correctAnswersCount',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            Text(
              'Accuracy: ${attemptPercentage.toStringAsFixed(2)}%',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Correct Answers:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            for (int i = 0; i < questionsData.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Question ${i + 1}: ${questionsData[i]['text']}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5.0),
                        for (int j = 0;
                            j < questionsData[i]['options'].length;
                            j++)
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: (j == questionsData[i]['correctAnswer'])
                                  ? Colors.green.withOpacity(0.5)
                                  : (j == selectedAnswers[i])
                                      ? Colors.red.withOpacity(0.5)
                                      : null,
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${String.fromCharCode(65 + j)}. ${questionsData[i]['options'][j]}',
                              style: TextStyle(
                                fontSize: 14,
                                color: (j == questionsData[i]['correctAnswer'])
                                    ? Colors.green
                                    : (j == selectedAnswers[i])
                                        ? Colors.red
                                        : null,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
