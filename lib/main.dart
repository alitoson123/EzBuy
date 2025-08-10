import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Core/Services/Bloc_observes/my_Bloc_observe.dart';
import 'package:e_commerce_app/Core/Services/service_locator/sevice_locator.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(const EzBuy());
}

class EzBuy extends StatelessWidget {
  const EzBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
