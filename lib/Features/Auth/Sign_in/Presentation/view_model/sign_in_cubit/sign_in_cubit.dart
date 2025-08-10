import 'package:e_commerce_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/view_model/sign_in_cubit/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit(this.authRepoObject) : super(SignInInitialState());

  final AuthRepo authRepoObject;
  Future<void> SignInWithEmailAndPasswordMethod(context,
      {required String email,
      required String password,
      required bool isSelected}) async {
    emit(SignInInitialState());
    var user = await authRepoObject.signInWithEmailAndPassword( context,
        email: email, password: password, isSelected: isSelected);

    user.fold(
      (Failure) => emit(SignInErrorState(errMessage: Failure.errMessage)),
      (Sucess) => emit(SignInSuccessState(userEntity: Sucess)),
    );
  }
}
