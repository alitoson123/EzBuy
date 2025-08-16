import 'package:e_commerce_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:e_commerce_app/Features/Auth/Sign_up/Presentation/view_model/Sign_up_cubit/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.authRepoObject) : super(SignUpInitialState());
  final AuthRepo authRepoObject;

  Future<void> signUpMethod(
    context, {
    required String email,
    required String password,

  }) async {
    emit(SignUpInitialState());
    var result = await authRepoObject.signup(context,
        email: email, password: password, );

    result.fold(
      (failure) => emit(SignUpFailureState(errMessage: failure.errMessage)),
      (success) => emit(SignUpSuccessState(userEntity: success)),
    );
  }
}
