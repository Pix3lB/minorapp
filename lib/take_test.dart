import 'package:flutter/material.dart';

class TakeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Take a Test',
              style: TextStyle(fontSize: 20),
            ),
            // You can add more widgets for taking a test here
          ],
        ),
      ),
    );
  }
}
