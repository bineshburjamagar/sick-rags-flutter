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
        appBar: AppBar(
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
        body: Column(
          children: [
            Center(child: Text('${userProv.user?.displayName}')),
            if (userProv.user?.email == 'binesh@gmail.com') const AdminWidget()
          ],
        ),
      );
    });
  }
}
