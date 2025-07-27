import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/goToNextPageWithCheckLoginStatus.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/myElevated_button.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/myListGenerate.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/Widgets/onBboardingBody.dart';
import 'package:flutter/material.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  final PageController pageController = PageController();


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Onbboardingbody(
                myOnPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                controller: pageController,
              ),
            ),
            Mylistgenerate(currentIndex: currentIndex),
            const SizedBox(height: 20),
            MyelevatedButton(
              onPressed: () {
                helper().goToNextPageWithCheckLoginStatusMethod(
                  context: context,
                  currentIndex: currentIndex,
                  pageController: pageController,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
