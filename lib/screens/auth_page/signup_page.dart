// ignore_for_file: use_build_context_synchronously

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/components/custom_button.dart';
import 'package:sick_rags_flutter/components/custom_text_field.dart';
import 'package:sick_rags_flutter/config/config.dart';
import 'package:sick_rags_flutter/screens/base_page.dart';
import 'package:sick_rags_flutter/utils/validators.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String routeName = "/signuppage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SignUpPage());
  }

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  double margin = 100;
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    changeToOriginal();
  }

  void changeToOriginal() {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        margin = 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                        CustomTextField(
                          labelText: 'Full Name',
                          hintText: 'Enter your full name',
                          isRequired: true,
                          validator: Validators.isRequired,
                          controller: _fullNameController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          isRequired: true,
                          validator: Validators.email,
                          controller: _emailController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          isPassword: true,
                          isRequired: true,
                          validator: Validators.password,
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter your password',
                          isPassword: true,
                          isRequired: true,
                          validator: (g) => Validators.confirmPassword(
                              g, _confirmPasswordController.text),
                          controller: _confirmPasswordController,
                        ),
                        const SizedBox(height: 80.0),
                        CustomButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                BotToast.showLoading();
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _confirmPasswordController.text,
                                  );
                                  User? user =
                                      FirebaseAuth.instance.currentUser;

                                  if (user != null) {
                                    user.updateDisplayName(
                                        _fullNameController.text);
                                  }
                                  BotToast.showText(
                                      text: 'Successfully user created!',
                                      contentColor: Colors.red);
                                  Navigator.pushNamed(
                                      context, BasePage.routeName);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    BotToast.showText(
                                        text: e.code, contentColor: Colors.red);
                                  } else if (e.code == 'email-already-in-use') {
                                    BotToast.showText(
                                        text: e.code, contentColor: Colors.red);
                                  }
                                } catch (e) {
                                  BotToast.showText(
                                      text: '$e', contentColor: Colors.red);
                                }
                              }
                            },
                            label: 'Sign Up')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
