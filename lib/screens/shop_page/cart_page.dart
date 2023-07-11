import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/components/custom_button.dart';
import 'package:sick_rags_flutter/config/config.dart';
import 'package:sick_rags_flutter/core/providers/providers.dart';
import 'package:sick_rags_flutter/screens/shop_page/products_list_page.dart';

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
    return Consumer3<ProductsProvider, CartProvider, OrdersProvider>(
        builder: (context, prodProv, cartProv, orderProv, child) {
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
                  return CartProductCard(
                      quantity: cartProv.cartList[index].quantity,
                      productModel: prodProv.productsList
                          .where((element) =>
                              element.id == cartProv.cartList[index].productId)
                          .first);
                }, childCount: cartProv.cartList.length),
              ),
            ),
            if (cartProv.cartList.isNotEmpty)
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'TOTAL',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyColor,
                            ),
                          ),
                          Text(
                            'Rs ${cartProv.getTotalPrice(cartProv.cartList)}',
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            else
              const SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 200),
                sliver: SliverToBoxAdapter(
                  child: Center(
                      child: Text(
                    'Your cart is empty :(',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.greyColor,
                    ),
                  )),
                ),
              )
          ],
        ),
        bottomNavigationBar: cartProv.cartList.isNotEmpty
            ? Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 23.0, vertical: 20.0),
                child: CustomButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('orders')
                          .add({
                        'userId': FirebaseAuth.instance.currentUser?.uid,
                        'orders':
                            cartProv.cartList.map((e) => e.toJson()).toList()
                      });
                      await cartProv.deleteAllCart();
                      await cartProv.getCartList();
                      await orderProv.getOrders();
                    },
                    label: 'Checkout'),
              )
            : Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 23.0, vertical: 20.0),
                child: CustomButton(
                    onPressed: () async {
                      Navigator.of(context)
                          .pushReplacementNamed(ProductsListPage.routeName);
                    },
                    label: 'Go Shopping'),
              ),
      );
    });
  }
}
