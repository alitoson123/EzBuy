import 'package:e_commerce_app/Core/Errors/failure.dart';
import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Core/messages/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  // late UserModel usermodel;
  //var userId;
  Future<User> SignInWithEmailAndPAsswordAndIsLoginCheck(BuildContext context,
      {required String email,
      required String password,
      required bool isSelected}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await IsLoginCheck(isSelected: isSelected);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';

       /* Message().MessageErrorMethod(
          context,
          message: 'No user found for that email.',
        );*/
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';

       /* Message().MessageErrorMethod(
          context,
          message: 'Wrong password provided for that user.',
        );*/
      }
      throw 'there was some thing wrong on firebase auth side.';
    } catch (e) {
      throw 'there was some thing wrong';
    }
  }

  Future<void> IsLoginCheck({required bool isSelected}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isSelected) {
      await prefs.setBool('isRemembered', true);
    }
  }

  Future<User> SignUpMethod(
    BuildContext context, {
    required bool isSelected,
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //  userId = FirebaseAuth.instance.currentUser!.uid;
      await IsLoginCheck(isSelected: isSelected);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';

        /*  Message().MessageErrorMethod(context,
            message: 'The password provided is too weak.');*/
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists.';

      /*  Message().MessageErrorMethod(context,
            message: 'The account already exists.');*/
      }
      throw 'there was some thing wrong on firebase auth side.';
    } catch (e) {
      throw 'there was some thing wrong';
    }
  }

  Future<void> ForgetPasswordMethod(
    BuildContext context, {
    required String email,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Message().MessageErrorMethod(context,
          message:
              'Password Reset Email Sent Successfully, please check your email and login with your new password.');

      GoRouter.of(context).pop();
    } on FirebaseAuthException catch (e) {
      return Message()
          .MessageErrorMethod(context, message: e.message.toString());
    }
  }

  Future<void> SignInWithGoogleMethod(
    BuildContext context, {
    required bool isSelected,
  }) async {
    try {
      final userCred = await signInWithGoogle();

      Message().MessageSuccessMethod(context,
          message: 'Google sign-in successfully');
      //  userId = userCred.user!.getIdTokenResult();
      await IsLoginCheck(isSelected: isSelected);

      GoRouter.of(context).go(Navigate.KHomePage);
    } on FirebaseAuthException catch (e) {
      return Message()
          .MessageErrorMethod(context, message: e.message.toString());
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
    BuildContext context, {
    required bool isSelected,
  }) async {
    try {
      final userCred = await signInWithFacebook();

      Message().MessageSuccessMethod(context,
          message: 'Facebook sign-in successfully');

      // userId = userCred.user!.getIdToken();

      await IsLoginCheck(isSelected: isSelected);

      GoRouter.of(context).go(Navigate.KHomePage);
    } on FirebaseAuthException catch (e) {
      return Message()
          .MessageErrorMethod(context, message: e.message.toString());
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
