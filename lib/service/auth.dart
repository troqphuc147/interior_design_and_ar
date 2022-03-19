import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> streamUser() {
    try {
      _auth.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
    } catch (e) {
      print('error' + e.toString());
    }
    return _auth.authStateChanges();
  }

  User? get getCurrentUser => _auth.currentUser;
  Future signUpWithEmailAndPass(
      String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = getCurrentUser!;
      user.updateDisplayName(name);
      return "sign up";
    } catch (e) {
      print('error' + e.toString());
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('error' + e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPass(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "sign in";
    } catch (e) {
      print('error' + e.toString());
    }
  }

  Future changePassword(
      String? email, String currentlyPass, String newpass) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
          email: email.toString(), password: currentlyPass);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
      _auth.currentUser!.updatePassword(newpass);
      return ("Update password completed");
    } catch (e) {}
  }

  Future resetPassword(email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "Sent email";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
  Future changeName(String displayName) async {
    try{
      await _auth.currentUser!.updateDisplayName(displayName);
    }
    catch(e){
      print('error' + e.toString());
    }
  }
}