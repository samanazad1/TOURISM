import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/assistant/helper.dart';
import 'package:tourism/model/user_model.dart';

class UserController with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  bool? _isLoading = false;
  bool? get isLoading => _isLoading;

  void setLoggedStatus(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }

  void setLoadingStatus(bool isLoggedIn) {
    _isLoading = isLoggedIn;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      setLoadingStatus(true);
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setLoadingStatus(false);

      print("Login successful");
    } on FirebaseAuthException catch (e) {
      setLoadingStatus(false);

      if (e.code == 'user-not-found') {
        showMyToast(message: "No user found with this email", errorType: true);
      } else if (e.code == 'wrong-password') {
        showMyToast(message: "Incorrect password", errorType: true);
      } else {
        showMyToast(message: "Something went wrong", errorType: true);
      }

      print('Login error: $e');
    }
  }

  Future<void> logout() async {
    setLoadingStatus(true);
    try {
      print("pqpqp$_isLoggedIn");
      await _auth.signOut().then((v) => setLoggedStatus(false));

      setLoadingStatus(false);
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      showMyToast(message: "Something went wrong", errorType: true);

      setLoadingStatus(false);
      print('Login error: $e');
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String gender,
  }) async {
    setLoadingStatus(true);
    try {
      print("pqpqp$_isLoggedIn");
      // Register the user with Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Retrieve the user ID (UID)
      String uid = userCredential.user!.uid;

      // Create a user data map
      Map<String, dynamic> userData = {
        'id': uid,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'userToken': '' // Initialize empty; you can add a token here if needed.
      };

      setLoggedStatus(true);
      _userModel = UserModel(
          email: email,
          gender: gender,
          id: uid,
          name: name,
          phoneNumber: phoneNumber,
          userToken: "414|fpgd7tfpq8bc[wctwpcxcvt8 5]");
      // Save the user data to Firestore
      await FirebaseFirestore.instance.collection('user').add(userData);

      print("cvbcv$_isLoggedIn");

      // Optionally, store the user token in SharedPreferences for local use
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'userToken', uid); // or a real token if you have one
      setLoadingStatus(false);
      print("User registered and data stored successfully.");
    } catch (error) {
      showMyToast(message: "Something went wrong", errorType: true);

      setLoadingStatus(false);
      print("Error creating user: $error");
    }
  }

  Future<void> updateUser({
    required UserModel user,
  }) async {
    setLoadingStatus(true);
    try {
      // Use the `id` from the provided UserModel as the document ID
      String uid = user.id;

      // Create an updated user data map
      Map<String, dynamic> updatedUserData = {
        'name': user.name,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'gender': user.gender,
      };

      print(uid);
      // Update the user document in Firestore

      // Update the local UserModel instance
      _userModel = user;
      notifyListeners();

      // Optionally update SharedPreferences (if required for local storage)
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', user.name);
      await prefs.setString('email', user.email);
      await prefs.setString('phoneNumber', user.phoneNumber);

      print("User updated successfully in Firestore.");
      showMyToast(message: "Profile updated successfully.");
    } catch (error) {
      print("Error updating user: $error");
      showMyToast(message: "Failed to update profile.", errorType: true);
    } finally {
      setLoadingStatus(false);
    }
  }
}
