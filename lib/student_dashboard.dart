import 'package:flutter/material.dart';

void main() {
  runApp(StudentDashboardApp());
}

class StudentDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentDashboard(),
    );
  }
}

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int _currentIndex = 0; // Index of the selected tab.

  // List of widgets for each tab.
  final List<Widget> _tabs = [
    ExamSection(),
    ResultSection(),
    UpcomingTestsSection(),
    ProfileSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard"),
      ),
      body: _tabs[_currentIndex], // Display the selected tab content.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change the selected tab.
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment,
              color: Colors.black,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: Colors.black,
            ),
            label: "Results",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
              color: Colors.black,
            ),
            label: "Exams",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            label: "Upcoming Tests",
          ),
        ],
      ),
    );
  }
}

// Implement ProfileSection, ResultSection, ExamSection, and UpcomingTestsSection widgets with your UI design and functionality.

class ProfileSection extends StatefulWidget {
  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://example.com/profile-image.jpg'), // Replace with the student's profile picture URL
            ),
          ),
          SizedBox(height: 16.0),
          isEditing
              ? ProfileForm(
                  nameController: nameController,
                  emailController: emailController,
                  studentIdController: studentIdController,
                  mobileNumberController: mobileNumberController,
                  onSave: () {
                    // Save the updated profile information
                    setState(() {
                      isEditing = false;
                    });
                  },
                )
              : Column(
                  children: [
                    Text(
                      'Student Name', // Replace with the student's name
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Email: student@example.com', // Replace with the student's email
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Mobile Number: +1234567890', // Replace with the student's mobile number
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Student ID: 123456', // Replace with the student's ID
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isEditing = true;
              });
            },
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController studentIdController;
  final TextEditingController mobileNumberController;
  final Function onSave;

  ProfileForm({
    required this.nameController,
    required this.emailController,
    required this.studentIdController,
    required this.mobileNumberController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.0),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextFormField(
          controller: mobileNumberController,
          decoration: InputDecoration(labelText: 'Mobile Number'),
        ),
        TextFormField(
          controller: studentIdController,
          decoration: InputDecoration(labelText: 'Student ID'),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Save the updated profile information
            onSave();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}

class ResultSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Exam Results',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          ExamResultItem(
            examTitle: 'Math Exam',
            score: '85%',
            date: 'October 15, 2023',
          ),
          ExamResultItem(
            examTitle: 'Science Exam',
            score: '92%',
            date: 'October 20, 2023',
          ),
          // Add more ExamResultItem widgets for additional results
        ],
      ),
    );
  }
}

class ExamResultItem extends StatelessWidget {
  final String examTitle;
  final String score;
  final String date;

  ExamResultItem({
    required this.examTitle,
    required this.score,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          examTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text('Score: $score', style: const TextStyle(fontSize: 16)),
        Text('Date: $date', style: const TextStyle(fontSize: 16)),
        const Divider(color: Colors.grey, height: 20),
      ],
    );
  }
}

class ExamResultTile extends StatelessWidget {
  final String examTitle;
  final String score;
  final String date;

  ExamResultTile({
    required this.examTitle,
    required this.score,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Exam: $examTitle',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Score: $score',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Date: $date',
          style: const TextStyle(fontSize: 16),
        ),
        const Divider(), // Add a divider between result entries
      ],
    );
  }
}

class ExamSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Available Exams',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          ExamItem(
            examTitle: 'Math Exam',
            description: 'Test your math skills',
            duration: '60 minutes',
          ),
          ExamItem(
            examTitle: 'Science Exam',
            description: 'Explore the world of science',
            duration: '45 minutes',
          ),
          // Add more ExamItem widgets for additional exams
        ],
      ),
    );
  }
}

class ExamItem extends StatelessWidget {
  final String examTitle;
  final String description;
  final String duration;

  ExamItem({
    required this.examTitle,
    required this.description,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(examTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: $description',
                style: const TextStyle(fontSize: 16)),
            Text('Duration: $duration', style: const TextStyle(fontSize: 16)),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Add code to start the exam
          },
          child: const Text('Start Exam'),
        ),
      ),
    );
  }
}

class UpcomingTestsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Upcoming Tests',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          UpcomingTestItem(
            testTitle: 'History Test',
            date: 'November 5, 2023',
            time: '9:00 AM',
          ),
          UpcomingTestItem(
            testTitle: 'English Literature Test',
            date: 'November 8, 2023',
            time: '2:30 PM',
          ),
          // Add more UpcomingTestItem widgets for additional upcoming tests
        ],
      ),
    );
  }
}

class UpcomingTestItem extends StatelessWidget {
  final String testTitle;
  final String date;
  final String time;

  UpcomingTestItem({
    required this.testTitle,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(testTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: $date', style: const TextStyle(fontSize: 16)),
            Text('Time: $time', style: const TextStyle(fontSize: 16)),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Add code to register for the test
          },
          child: const Text('Register'),
        ),
      ),
    );
  }
}
