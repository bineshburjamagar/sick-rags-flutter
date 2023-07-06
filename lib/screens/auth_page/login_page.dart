import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/components/custom_button.dart';
import 'package:sick_rags_flutter/components/custom_text_field.dart';
import 'package:sick_rags_flutter/config/config.dart';
import 'package:sick_rags_flutter/screens/auth_page/signup_page.dart';
import 'package:sick_rags_flutter/screens/nav_page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = "/loginpage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const LoginPage());
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double margin = 380;

  @override
  void initState() {
    super.initState();
    changeToOriginal();
  }

  void changeToOriginal() {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        margin = 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: EdgeInsets.only(top: margin),
            child: Column(
              children: [
                const Text(
                  'SICK RAGS',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Caveat',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 23.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome Back !',
                        style: TextStyle(
                            fontFamily: 'Caveat',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const SignUpPage(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      const CustomTextField(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        isRequired: true,
                      ),
                      const SizedBox(height: 20.0),
                      const CustomTextField(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        isPassword: true,
                        isRequired: true,
                      ),
                      const SizedBox(height: 80.0),
                      CustomButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              HomePage.routeName,
                            );
                          },
                          label: 'Sign In')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
