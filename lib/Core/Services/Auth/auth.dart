import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Core/messages/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Future<void> SignInAndIsLoginCheck(BuildContext context,
      {required String email,
      required String password,
      required bool isSelected}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Message().MessageMethod(
        context,
        message: 'Sign in successfully',
      );

      await IsLoginCheck(isSelected: isSelected);

      GoRouter.of(context).go(Navigate.KHomePage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Message().MessageMethod(
          context,
          message: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        Message().MessageMethod(
          context,
          message: 'Wrong password provided for that user.',
        );
      }
    }
  }

  Future<void> IsLoginCheck({required bool isSelected}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isSelected) {
      await prefs.setBool('isRemembered', true);
    }
  }

  Future<void> SignUpMethod(
    BuildContext context, {
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password == confirmPassword) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        GoRouter.of(context).go(Navigate.KCompleteSignUpPage);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Message().MessageMethod(context,
              message: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Message()
              .MessageMethod(context, message: 'The account already exists.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      Message().MessageMethod(context, message: 'Password does not match');
    }
  }

  Future<void> ForgetPasswordMethod(
    BuildContext context, {
    required String email,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      Message().MessageMethod(context,
          message:
              'Password Reset Email Sent Successfully, please check your email and login with your new password.');

      GoRouter.of(context).pop();
    } on FirebaseAuthException catch (e) {
      return Message().MessageMethod(context, message: e.message.toString());
    }
  }

  Future<void> SignInWithGoogleMethod(
    BuildContext context,
  ) async {
    try {
      final userCred = await signInWithGoogle();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Google sign-in successfully'),
        ),
      );
      GoRouter.of(context).push(Navigate.KHomePage);
    } on FirebaseAuthException catch (e) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> SignInWithFacebookMethod(
    BuildContext context,
  ) async {
    try {
      final userCred = await signInWithFacebook();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Facebook sign-in successfully'),
        ),
      );
      GoRouter.of(context).push(Navigate.KHomePage);
    } on FirebaseAuthException catch (e) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
}
