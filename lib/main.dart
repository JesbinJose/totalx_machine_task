import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:totalx_machine_task/auth/auth_service.dart';
import 'package:totalx_machine_task/firebase_options.dart';
import 'package:totalx_machine_task/presentation/screens/auth/login.dart';
import 'package:totalx_machine_task/presentation/screens/home/home.dart';
import 'package:totalx_machine_task/presentation/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: PhoneNumberAuthService().isLoggedIn()
          ?  HomeScreen()
          : LoginScreen(),
    );
  }
}
