import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/components/custom_button.dart';
import 'package:sick_rags_flutter/config/config.dart';

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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      ...List.generate(
                        50,
                        (index) => const Expanded(
                            child: Text(
                          '-',
                          style: TextStyle(color: Colors.grey),
                        )),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyColor,
                        ),
                      ),
                      Text(
                        'Rs 90000',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
        child: CustomButton(onPressed: () {}, label: 'Checkout'),
      ),
    );
  }
}
