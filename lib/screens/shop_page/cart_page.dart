import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  static const String routeName = "/cartpage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),
            ),
            centerTitle: true,
            title: const Text(
              'My Cart',
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 24.0,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return const CartProductCard();
              }, childCount: 2),
            ),
          ),
        ],
      ),
    );
  }
}
