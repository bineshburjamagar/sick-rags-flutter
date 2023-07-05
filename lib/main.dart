import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/config/app_route.dart';
import 'package:sick_rags_flutter/screens/auth_page/login_page.dart';
import 'package:sick_rags_flutter/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: SplashPage.routeName,
      onGenerateRoute: AppRoute.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
