import 'package:e_commerce_app/Features/Forget_Password/Presentation/Views/forget_password_view.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/home_view.dart';
import 'package:e_commerce_app/Features/On_Boarding/Presentation/Views/on_boarding_view.dart';
import 'package:e_commerce_app/Features/Sign_In/Presentation/Views/sign_in_view.dart';
import 'package:e_commerce_app/Features/Sign_up/Presentation/Views/complete_sign_up_view.dart';
import 'package:e_commerce_app/Features/Sign_up/Presentation/Views/sign_up_view.dart';
import 'package:e_commerce_app/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:go_router/go_router.dart';

class Navigate {
 // static String KinitialPage = '/';
  static String KOnBoardingPage = '/OnBoarding';
  static String KSignInPage = '/SignInPage';
  static String KForgetPasswordPage = '/ForgetPassword';
  static String KSignUpPage = '/SignUp';
  static String KCompleteSignUpPage = '/CompleteSignUp';
  static String KHomePage = '/';

  final GoRouter goRouter = GoRouter(
    routes: [
    /*  GoRoute(
        path: KinitialPage,
        builder: (context, state) => SplashView(),
      ),*/
      GoRoute(
        path: KOnBoardingPage,
        builder: (context, state) => OnBoardingView(),
      ),
      GoRoute(path: KSignInPage, builder: (context, state) => SignInView()),
      GoRoute(
          path: KForgetPasswordPage,
          builder: (context, state) => ForgetPasswordView()),
      GoRoute(path: KSignUpPage, builder: (context, state) => SignUpView()),
      GoRoute(
          path: KCompleteSignUpPage,
          builder: (context, state) => CompleteSignUpView()),
      GoRoute(path: KHomePage, builder: (context, state) => HomeView()),
    ],
  );
}
