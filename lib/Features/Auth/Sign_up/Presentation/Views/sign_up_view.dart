import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Core/Services/service_locator/sevice_locator.dart';
import 'package:e_commerce_app/Core/messages/message.dart';
import 'package:e_commerce_app/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/Views/Widgets/sign_in_view_body.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Presentation/Views/widgets/sign_up_view_body.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Presentation/view_model/Sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Presentation/view_model/Sign_up_cubit/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepoImpl>(),
      ),
      child: Scaffold(appBar: myAppbar(), 
      body: BlocConsumerOfSignUpViewBody()),
    );
  }

  AppBar myAppbar() {
    return AppBar(
      centerTitle: true,
      title: Opacity(opacity: .5, child: Text('Sign Up')),
      backgroundColor: Colors.white,
    );
  }
}

class BlocConsumerOfSignUpViewBody extends StatelessWidget {
  const BlocConsumerOfSignUpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpFailureState) {
          Message().MessageErrorMethod(context, message: state.errMessage);
        }
        if (state is SignUpSuccessState) {
          Message()
              .MessageSuccessMethod(context, message: 'Sign up successfully.');
          GoRouter.of(context).push(Navigate.KCompleteSignUpPage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignUpLoadingState ? true : false,
            child: SignUpViewBody());
      },
    );
  }
}
