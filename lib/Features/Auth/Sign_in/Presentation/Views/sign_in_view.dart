import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Core/messages/message.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/sign_in_view_body.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/view_model/sign_in_cubit/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMethod(),
      body: BloconsumerOfSignInBody(),
    );
  }

  AppBar AppBarMethod() {
    return AppBar(
      centerTitle: true,
      title: Opacity(opacity: .5, child: Text('Sign In')),
      backgroundColor: Colors.white,
    );
  }
}

class BloconsumerOfSignInBody extends StatelessWidget {
  const BloconsumerOfSignInBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInErrorState) {
          Message().MessageErrorMethod(context, message: state.errMessage);
        }
        if (state is SignInSuccessState) {
          Message().MessageSuccessMethod(
            context,
            message: 'Sign in successfully',
          );

          GoRouter.of(context).go(Navigate.KHomePage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignInLoadingState ? true : false,
            child: SignInViewBody());
      },
    );
  }
}
