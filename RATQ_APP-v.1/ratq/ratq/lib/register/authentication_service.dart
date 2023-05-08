import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ratq/home/home_screen.dart';
import 'package:ratq/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum AuthStatus {
  successful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Your password should be at least 6 characters.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Your email or password is wrong.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "The email address is already in use by another account.";
        break;
      default:
        errorMessage = "An error occured. Please try again later.";
    }
    return errorMessage;
  }
}

//Reset user password
class AuthenticationService {
  static final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  static String get currentUserUid => _auth.currentUser!.uid;

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print('Failed to reset password: $e');
      return false;
    }
  }

  Future<String?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (result.user != null) {
      return result.user!.uid;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (result.user != null) {
      return result.user!.uid;
    }
    return null;
  }

  Future addUserData({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    final id = AuthenticationService.currentUserUid;
    final newUser = MyUser(
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
    await _firestore
        .collection('users')
        .doc(AuthenticationService.currentUserUid)
        .set(
          newUser.toFirebase(),
        );
  }

  Future<MyUser?> getUser() async {
    DocumentSnapshot<Map<String, dynamic>> firebaseUser = await _firestore
        .collection('users')
        .doc(AuthenticationService.currentUserUid)
        .get();
    final userData = firebaseUser.data();

    if (userData != null) {
      final user = MyUser.fromFirebase(firebaseObj: firebaseUser.data()!);
      return user;
    }
    return null;
  }

  bool validatePassword({required String? password}) {
    if (password == null) {
      return false;
    }
    if (password.length < 6) {
      return false;
    }
    print(true);
    bool hasUppercase = false;
    bool hasSymbol = false;
    for (int i = 0; i < password.length; i++) {
      if (password[i] == password[i].toUpperCase()) {
        hasUppercase = true;
      }
      if (!password[i].contains(RegExp(r'[a-zA-Z0-9]'))) {
        hasSymbol = true;
      }
    }
    return hasUppercase && hasSymbol;
  }

  bool validateEmail(String? email) {
    if (email == null) {
      return false;
    }
    String pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool validateName(String? name) {
    if (name == null) {
      return false;
    }
    if (name.isEmpty) {
      return false;
    }
    String pattern = r'^[a-zA-Z ]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(name);
  }
}
