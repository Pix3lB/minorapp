import 'package:flutter/material.dart';
import 'package:testproject/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget _buildTextField(
    IconData icon,
    String hintText,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 28, 26, 26),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.greenAccent],
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.9,
                  margin: const EdgeInsets.all(100),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.greenAccent, Colors.blue],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: Text(
                          'Create!!',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      _buildTextField(Icons.abc_rounded, 'First Name'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      _buildTextField(Icons.abc_rounded, 'Last Name'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      _buildTextField(Icons.person, 'Username'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _buildTextField(Icons.mail, 'Email Address'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _buildTextField(Icons.lock, 'Password'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _buildTextField(Icons.lock, 'Confirm Password'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.045,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
