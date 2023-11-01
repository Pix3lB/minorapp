import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> createUserProfile({
    required String uid,
    required String fname,
    required String lname,
    bool? isTeacher,
  }) async {
    final firestore = FirebaseFirestore.instance;
    final userRef = firestore.collection('users').doc(uid);

    try {
      await userRef.set({
        'fname': fname,
        'lname': lname,
        'isTeacher': isTeacher,
      });
    } catch (e) {
      print('Error creating user profile: $e');
    }
  }
}
