import 'package:e_commerce_app/Features/On_Boarding/Data/models/onboarding_model.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/onBoardingItem.dart';
import 'package:flutter/material.dart';

class Onbboardingbody extends StatefulWidget {
  const Onbboardingbody(
      {super.key, required this.myOnPageChanged, required this.controller});
  final Function(int) myOnPageChanged;
  final PageController controller;
  @override
  State<Onbboardingbody> createState() => _OnbboardingbodyState();
}

class _OnbboardingbodyState extends State<Onbboardingbody> {
  final List<OnboardingModel> onboardingModelsList = [
    OnboardingModel(
        description: 'Find amazing products at great prices \n all in one app.',
        image: 'assets/images/Online Groceries-cuate (1).svg'),
    OnboardingModel(
        description: 'Your orders arrive fast, safe, and always on time.',
        image: 'assets/images/In no time-pana (1).svg'),
    OnboardingModel(
        description:
            'Pay with confidence secure options including cards, wallets, and cash on delivery.',
        image: 'assets/images/E-Wallet-pana.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.controller,
      onPageChanged: widget.myOnPageChanged,
      itemCount: onboardingModelsList.length,
      itemBuilder: (context, index) {
        return Onboardingitem(onboardingModel: onboardingModelsList[index]);
      },
    );
  }
}
