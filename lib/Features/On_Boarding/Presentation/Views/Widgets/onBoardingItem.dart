import 'package:e_commerce_app/Features/On_Boarding/Data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboardingitem extends StatelessWidget {
  const Onboardingitem({
    super.key,
    required this.onboardingModel,
  });
  final OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'EzBuy',
          style: TextStyle(
            color: Color(0xff1E88E5),
            fontSize: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Opacity(
            opacity: .5,
            child: Text(
              onboardingModel.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        SvgPicture.asset(
          onboardingModel.image,
          height: 400,
        ),
      ],
    );
  }
}
