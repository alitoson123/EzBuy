import 'package:e_commerce_app/Core/Services/firebase_auth_service/firebase_auth.dart';
import 'package:e_commerce_app/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(authObject: Auth()),
  );

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}
