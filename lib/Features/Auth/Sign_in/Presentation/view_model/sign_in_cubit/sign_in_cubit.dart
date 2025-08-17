import 'package:e_commerce_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/view_model/sign_in_cubit/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit(this.authRepoObject) : super(SignInInitialState());

  final AuthRepo authRepoObject;
  Future<void> signInWithEmailAndPasswordMethod(
      {
  required String email,
  required String password,
}) async {
  emit(SignInInitialState());

  final user = await authRepoObject.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  user.fold(
    (failure) => emit(SignInErrorState(errMessage: failure.errMessage)),
    (success) => emit(SignInSuccessState(userEntity: success)),
  );
}


  Future<void> SignInWithGoogleMethod() async {
    emit(SignInInitialState());
    var user = await authRepoObject.signInWithGoogle();
    user.fold(
      (Failure) => emit(SignInErrorState(errMessage: Failure.errMessage)),
      (Sucess) => emit(SignInSuccessState(userEntity: Sucess)),
    );
  }

  Future<void> SignInWithFacebookMethod() async {
    emit(SignInInitialState());
    var user = await authRepoObject.signInWithFacebook();
    user.fold(
      (Failure) => emit(SignInErrorState(errMessage: Failure.errMessage)),
      (Sucess) => emit(SignInSuccessState(userEntity: Sucess)),
    );
  }
}
