import 'package:flutter/material.dart';
import 'package:testproject/create_test.dart';

void main() => runApp(const TeacherDashboard());

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        backgroundColor: Colors.blueAccent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            title: const Text('Create New Test'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateTest(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Past Tests'),
            onTap: () {
              // Handle item 2 tap
            },
          ),
          ListTile(
            title: const Text('View Students'),
            onTap: () {
              // Handle item 2 tap
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Handle item 2 tap
            },
          ),
        ]),
      ),
      body: const TeacherDashboardBody(),
    ));
  }
}

class TeacherDashboardBody extends StatelessWidget {
  const TeacherDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome, #teachername!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                // Image aligned to the left
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.laptop),
                        iconSize: 25.00,
                        onPressed: () {
                          //to add
                        },
                      );
                    },
                  ),
                ),
                // Text aligned to the right
                const Expanded(
                  child: Text(
                    'DSA quiz', // Replace with your text
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                // Image aligned to the left
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.games_rounded),
                        onPressed: () {
                          //to add
                        },
                      );
                    },
                  ),
                ),
                // Text aligned to the right
                const Expanded(
                  child: Text(
                    'C++ quiz',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
