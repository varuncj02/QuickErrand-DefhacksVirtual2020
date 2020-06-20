import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

/*
TODO: Implement the authentication for the Login Page in Firebase
*/

class AuthenticationService with ChangeNotifier {
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  Future<FirebaseUser> getUser(){
    return _authentication.currentUser();
  }

  Future createUser({String name, String password}) async{
    
  }
}