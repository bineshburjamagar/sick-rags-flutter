import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/config/app_colors.dart';
import 'package:sick_rags_flutter/config/app_route.dart';
import 'package:sick_rags_flutter/core/providers/base_page_provider.dart';
import 'package:sick_rags_flutter/core/providers/login_page_provider.dart';
import 'package:sick_rags_flutter/screens/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginPageProvider()),
        ChangeNotifierProvider(create: (_) => BasePageProvider())
      ],
      child: const MyApp(),
    ),
  );
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
        appBarTheme: const AppBarTheme(color: Colors.white),
        navigationBarTheme: NavigationBarThemeData(
            iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(
              color: AppColors.primaryColor,
            );
          } else {
            return const IconThemeData(
              color: Colors.white,
            );
          }
        })),
        useMaterial3: true,
      ),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: SplashPage.routeName,
      onGenerateRoute: AppRoute.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
