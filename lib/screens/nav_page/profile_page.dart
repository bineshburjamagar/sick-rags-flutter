import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/core/providers/user_provider.dart';
import 'package:sick_rags_flutter/widgets/admin_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProv, child) {
      return Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: const Text(''),
          title: const Text(
            'My Profile',
            style: TextStyle(fontSize: 24.0, fontFamily: 'Caveat'),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then((value) {
                    Phoenix.rebirth(context);
                  });
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 23.0,
          ),
          children: [
            if (userProv.user?.email != 'binesh@gmail.com')
              const SizedBox(height: 100.0),
            Text(
              'Hello, \n${userProv.user?.displayName}',
              style: const TextStyle(fontSize: 28.0, fontFamily: 'Caveat'),
            ),
            const SizedBox(height: 50.0),
            if (userProv.user?.email == 'binesh@gmail.com') AdminWidget()
          ],
        ),
      );
    });
  }
}
