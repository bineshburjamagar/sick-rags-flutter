import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/core/providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProv, child) {
      return Scaffold(
        body: Center(child: Text('${userProv.user?.displayName}')),
      );
    });
  }
}
