import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Stream<User?> get userStream {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
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
    try {
      await _auth.currentUser!.updateDisplayName(displayName);
    } catch (e) {
      print('error' + e.toString());
    }
  }

  Future signInWithGoogleAccount() async {
    try {
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      return 'login-success';
    } on FirebaseAuthException catch (e) {
      String error = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          error =
              "This account is linked with another provider! Try another provider!";
          break;
        case 'email-already-in-use':
          error = "Your email address has been registered.";
          break;
        case 'invalid-credential':
          error = "Your credential is malformed or has expired.";
          break;
        case 'user-disabled':
          error = "This user has been disable.";
          break;
        default:
          error = e.code;
      }
      return error;
    } on PlatformException catch (e) {
      return e.code;
    } on NoSuchMethodError catch (e) {
      return e;
    }
  }

  Future signInWithFacebookVer2() async {
    try {
      final facebookLogin = FacebookLogin();
      facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
      final result = await facebookLogin.logIn(['email']);

      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final credential =
              FacebookAuthProvider.credential(result.accessToken.token);
          await _auth.signInWithCredential(credential);
          break;
        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
      }

      return 'login-success';
    } on FirebaseAuthException catch (e) {
      String error = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          error =
              "This account is linked with another provider! Try another provider!";
          break;
        case 'email-already-in-use':
          error = "Your email address has been registered.";
          break;
        case 'invalid-credential':
          error = "Your credential is malformed or has expired.";
          break;
        case 'user-disabled':
          error = "This user has been disable.";
          break;
        default:
          error = e.code;
      }
      return error;
    } on PlatformException catch (e) {
      return e.code;
    }
  }
}
