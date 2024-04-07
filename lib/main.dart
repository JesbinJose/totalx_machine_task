import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totalx_machine_task/auth/auth_service.dart';
import 'package:totalx_machine_task/firebase_options.dart';
import 'package:totalx_machine_task/presentation/providers/cubit/employee_cubit.dart';
import 'package:totalx_machine_task/presentation/screens/auth/login.dart';
import 'package:totalx_machine_task/presentation/screens/home/home.dart';
import 'package:totalx_machine_task/presentation/theme.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: myTheme,
      home: BlocProvider(
        create: (context) => EmployeeCubit(),
        child: PhoneNumberAuthService().isLoggedIn()
            ?  HomeScreen()
            : LoginScreen(),
      ),
    );
  }
}
