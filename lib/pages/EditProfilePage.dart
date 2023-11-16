import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfile extends StatefulWidget {
  final User? user;

  const EditProfile({required this.user});

  @override
  _EditProfilePopupState createState() => _EditProfilePopupState();
}

class _EditProfilePopupState extends State<EditProfile> {
  late TextEditingController _fnameController;
  late TextEditingController _lnameController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();

    // Fetch user data from Firestore
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      // Access the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Fetch the user document
      DocumentSnapshot userDocument =
          await firestore.collection('users').doc(widget.user?.uid).get();

      // Check if the document exists
      if (userDocument.exists) {
        // Extract 'fname' and 'lname' from the document data
        String fname = userDocument['fname'] ?? '';
        String lname = userDocument['lname'] ?? '';

        // Set values to controllers
        _fnameController.text = fname;
        _lnameController.text = lname;
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Profile'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _fnameController,
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextField(
            controller: _lnameController,
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // TODO: Implement update logic and dismiss the popup
            updateProfile();
            Navigator.of(context).pop();
          },
          child: Text('Submit'),
        ),
        TextButton(
          onPressed: () {
            // Just dismiss the popup
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }

  // Implement your update logic here
  void updateProfile() async {
    try {
      // Access the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Update the user document in the 'users' collection
      await firestore.collection('users').doc(widget.user?.uid).update({
        'fname': _fnameController.text,
        'lname': _lnameController.text,
      });

      // Update the display name in FirebaseAuth
      await FirebaseAuth.instance.currentUser?.updateDisplayName(
        '${_fnameController.text} ${_lnameController.text}',
      );

      // Fetch user data again to ensure the updated values are displayed
      await fetchUserData();

      // Show a success message or handle accordingly
      print('Profile updated successfully');
    } catch (e) {
      // Handle the error, show an error message, or log
      print('Error updating profile: $e');
    }
  }
}
