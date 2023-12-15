import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/home_screen.dart';

import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA55EoqyMoFsW10vEZzHACRjRR3ochRbrw',
      appId: '1:193821087122:android:c344747c74bf517fe0dd4b',
      messagingSenderId: '193821087122',
      projectId: 'hospital-management-syst-b0430',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
