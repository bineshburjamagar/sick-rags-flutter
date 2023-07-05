import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/components/custom_button.dart';
import 'package:sick_rags_flutter/components/custom_text_field.dart';
import 'package:sick_rags_flutter/config/config.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static const String routeName = "/signuppage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                color: Colors.black,
                padding: const EdgeInsets.only(
                  top: 80,
                ),
                child: const Center(
                  child: Text(
                    'SICK RAGS',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Caveat',
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 180),
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
                      'Create an account.',
                      style: TextStyle(
                          fontFamily: 'Caveat',
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already a member? ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            'Sign In',
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
                    const SizedBox(height: 20.0),
                    const CustomTextField(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      isPassword: true,
                      isRequired: true,
                    ),
                    const SizedBox(height: 80.0),
                    CustomButton(onPressed: () {}, label: 'Sign Up')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
