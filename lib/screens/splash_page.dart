import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/config/config.dart';
import 'package:sick_rags_flutter/screens/base_page.dart';

import 'auth_page/auth_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routeName = "/splashpage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashPage());
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initializePage();
  }

  void initializePage() {
    Future(() {
      return FirebaseAuth.instance.currentUser != null;
    }).then(
      (value) {
        if (value) {
          Navigator.pushReplacementNamed(
            context,
            BasePage.routeName,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            LoginPage.routeName,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          'SICK RAGS',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Caveat',
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
    );
  }
}
