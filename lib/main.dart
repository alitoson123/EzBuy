import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Core/Services/Bloc_observes_service/my_Bloc_observe.dart';
import 'package:e_commerce_app/Core/Services/service_locator/sevice_locator.dart';
import 'package:e_commerce_app/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:e_commerce_app/Features/Auth/Sign_in/Presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:e_commerce_app/Features/Auth/Data/models/user_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());

  await Hive.openBox<UserModel>('userBox');

  runApp(const EzBuy());
}

class EzBuy extends StatelessWidget {
  const EzBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        getIt<AuthRepoImpl>(),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: KPrimaryColor),
          primaryColor: KPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        routerConfig: Navigate().goRouter,
      ),
    );
  }
}
