import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300.0,
            width: double.infinity,
            color: Colors.black,
            padding: const EdgeInsets.all(100.0),
            child: const Text(
              'SICK RAGS',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Caveat',
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 200),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 100.0),
                TextFormField()
              ],
            ),
          )
        ],
      ),
    );
  }
}
