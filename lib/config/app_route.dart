import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/screens/auth_page/login_page.dart';
import 'package:sick_rags_flutter/screens/auth_page/signup_page.dart';
import 'package:sick_rags_flutter/screens/base_page.dart';
import 'package:sick_rags_flutter/screens/nav_page/home_page.dart';
import 'package:sick_rags_flutter/screens/nav_page/products_details_page.dart';
import 'package:sick_rags_flutter/screens/splash_page.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return LoginPage.route();
      case SplashPage.routeName:
        return SplashPage.route();
      case SignUpPage.routeName:
        return SignUpPage.route();
      case HomePage.routeName:
        return HomePage.route();
      case BasePage.routeName:
        return BasePage.route();
      case ProductsDetailsPage.routeName:
        return ProductsDetailsPage.route();

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Not Found'),
            ),
          ),
        );
    }
  }
}
