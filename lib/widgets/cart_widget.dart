import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/core/providers/providers.dart';

import '../screens/shop_page/shop_page.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProv, child) {
      return Badge(
        alignment: Alignment.bottomLeft,
        isLabelVisible: cartProv.cartList.isNotEmpty,
        label: Text("${cartProv.cartList.length}"),
        backgroundColor: Colors.red,
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartPage.routeName);
          },
          icon: const Icon(
            Icons.shopping_cart_checkout_sharp,
            size: 23,
          ),
        ),
      );
    });
  }
}
