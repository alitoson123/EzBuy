import 'package:e_commerce_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:e_commerce_app/Features/Auth/Forget_Password/Presentation/view_model/Forget_password_cubit/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit(this.authRepoObject)
      : super(ForgetPasswordInitialState());

  final AuthRepo authRepoObject;
  Future<void> ForgetPasswordCubitMethod({required String email}) async {
    emit(ForgetPasswordInitialState());

    var result = await authRepoObject.forgetPassword(email: email);

    return result.fold(
      (failure) =>
          emit(ForgetPasswordFailureState(errMessage: failure.errMessage)),
      (success) => emit(ForgetPasswordSuccessState()),
    );
  }
}
