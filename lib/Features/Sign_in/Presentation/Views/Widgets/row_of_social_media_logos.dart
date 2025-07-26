import 'package:e_commerce_app/Core/navigate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/social_medial_logo.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class RowOfSocialMediaLogos extends StatelessWidget {
  const RowOfSocialMediaLogos({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMedialLogo(
          image: 'assets/images/images (1).png',
          myWidth: 30,
          myheight: 30,
          onTap: () async {
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
          },
        ),
        const SizedBox(width: 10),
        SocialMedialLogo(
          image: 'assets/images/facebook-f-logo-transparent-facebook-f-22.png',
          myWidth: 40,
          myheight: 40,
          onTap: () async {
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
          },
        ),
      ],
    );
  }
}

// ✅ Google Sign-In method using the correct API
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

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
