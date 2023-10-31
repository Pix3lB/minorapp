import 'package:flutter/material.dart';
import 'package:testproject/pages/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    double width = mQuery.size.width;
    double height = mQuery.size.height;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.blue[50]
              // image: DecorationImage(
              //     image: Svg("bluebg.svg"),
              //     fit: BoxFit.cover)
              ), // White background
          child: Center(
            child: Container(
              height: .6 * height,
              width: .6 * width, // Width of the rounded rectangle
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.school,
                    size: 75,
                    color: Colors.white,
                  )
                  // const Text(
                  //   'Welcome',
                  //   style: TextStyle(
                  //     fontSize: 24, // Font size for "Welcome"
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const Text(
                  //   'To Our',
                  //   style: TextStyle(
                  //     fontSize: 24, // Font size for "To Our"
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const Text(
                  //   'Online Test Platform',
                  //   style: TextStyle(
                  //     fontSize: 24, // Font size for "Online Test Platform"
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  ,
                  const SizedBox(height: 16),
                  const Text(
                    'An online test taking platform built for our minor project',
                    style: TextStyle(
                      fontSize: 18, // Font size for the description
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 52),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const loginPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20, // Font size for the button text
                        color: Theme.of(context)
                            .primaryColor, // Assumes that Theme.of(context).primaryColor returns a MaterialColor or Color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
