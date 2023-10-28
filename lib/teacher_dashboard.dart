import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppContainer(),
    );
  }
}

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          ProfilePage(),
           AttendancePage(),
           CheckingResultPage(), 
          QuestionnaireForm(),
         
          
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // Ensures all labels are displayed.
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Checking Result',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}

class QuestionnaireForm extends StatefulWidget {
  @override
  _QuestionnaireFormState createState() => _QuestionnaireFormState();
}

class _QuestionnaireFormState extends State<QuestionnaireForm> {
  List<Map<String, dynamic>> questions = [];
  TextEditingController questionController = TextEditingController();
  List<TextEditingController> optionControllers = List.generate(4, (index) => TextEditingController());
  TextEditingController textAnswerController = TextEditingController();
  String questionType = 'Multiple Choice';
  TextEditingController testNameController = TextEditingController(); // Added Test Name controller

  void addQuestion() {
    if (questionController.text.isNotEmpty) {
      if (questionType == 'Multiple Choice') {
        final options = optionControllers.map((controller) => controller.text).toList();
        questions.add({
          'testName': testNameController.text, // Added testName
          'question': questionController.text,
          'type': questionType,
          'options': options,
        });
      } else if (questionType == 'Text') {
        questions.add({
          'testName': testNameController.text, // Added testName
          'question': questionController.text,
          'type': questionType,
          'answer': textAnswerController.text,
        });
      }

      questionController.clear();
      optionControllers.forEach((controller) => controller.clear());
      textAnswerController.clear();
      setState(() {});
    }
  }

  void removeQuestion(int index) {
    questions.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Questionnaire Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: testNameController, // Added Test Name TextField
              decoration: InputDecoration(labelText: 'Test Name'),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButton<String>(
                    value: questionType,
                    items: <String>['Multiple Choice', 'Text'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        questionType = newValue ?? 'Multiple Choice';
                      });
                    },
                  ),
                ),
              ],
            ),
            TextField(
              controller: questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            if (questionType == 'Multiple Choice')
              for (int i = 0; i < 4; i++)
                TextField(
                  controller: optionControllers[i],
                  decoration: InputDecoration(labelText: 'Option ${i + 1}'),
                ),
            if (questionType == 'Text')
              TextField(
                controller: textAnswerController,
                decoration: InputDecoration(labelText: 'Answer (Text)'),
              ),
            ElevatedButton(
              onPressed: addQuestion,
              child: Text('Add Question'),
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: questions.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;
                return ListTile(
                  title: Text('Test: ${question['testName']}'), // Display Test Name
                  subtitle: Text('Question ${index + 1}: ${question['question']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeQuestion(index);
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}



class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Student Attendance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with the actual number of students
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Student Name $index'), // Replace with the student's name
                    subtitle: Text('Status: Present'), // Replace with the student's attendance status
                    trailing: Icon(Icons.edit), // You can use another icon to edit attendance
                    onTap: () {
                      // Add an action when tapping a student's attendance, e.g., to edit it.
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CheckingResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checking Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Student Results',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with the actual number of student results
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Student Name $index'), // Replace with the student's name
                    subtitle: Text('Score: ${85 - index}%'), // Replace with the student's score
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add an action when tapping a student result, e.g., to view the full result.
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/teacher_avatar.png'), // Add your teacher's profile image
            ),
            SizedBox(height: 20),
            Text(
              'Teacher Name', // Replace with the teacher's name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Subject: Math', // Replace with the teacher's subject
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add an action when the button is pressed, e.g., for editing the profile.
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

