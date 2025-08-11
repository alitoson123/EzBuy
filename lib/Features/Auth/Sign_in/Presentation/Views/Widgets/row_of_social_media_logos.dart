import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/social_medial_logo.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocProvider.of<SignInCubit>(context).SignInWithGoogleMethod();
          },
        ),
        const SizedBox(width: 10),
        SocialMedialLogo(
          image: 'assets/images/facebook-f-logo-transparent-facebook-f-22.png',
          myWidth: 40,
          myheight: 40,
          onTap: () async {
            BlocProvider.of<SignInCubit>(context).SignInWithFacebookMethod();
          },
        ),
      ],
    );
  }
}
