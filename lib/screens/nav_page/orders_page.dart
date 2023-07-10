import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        title: const Text(
          'My Orders',
          style: TextStyle(fontSize: 24.0, fontFamily: 'Caveat'),
        ),
      ),
      body: Container(),
    );
  }
}
