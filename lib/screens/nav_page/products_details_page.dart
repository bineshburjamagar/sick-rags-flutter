import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/core/models/models.dart';
import 'package:sick_rags_flutter/core/providers/providers.dart';

import '../../config/config.dart';
import '../../widgets/widgets.dart';

class ProductsDetailsPage extends StatelessWidget {
  const ProductsDetailsPage({
    Key? key,
    required this.model,
  }) : super(key: key);
  static const String routeName = "/productsdetailspage";
  static Route route(ProductModel model) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductsDetailsPage(
              model: model,
            ));
  }

  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductsProvider, CartProvider>(
        builder: (context, prodProv, cartProv, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ),
          actions: const [CartWidget()],
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            CustomCarouselSlider(
              heroTag: model.heroTag,
              images: model.images,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    model.name ?? "",
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'Rs ${model.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          RichText(
                            text: const TextSpan(
                                text: '4.8  ',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: '(5 reviews)',
                                    style: TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 12.0,
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  RichText(
                    text: TextSpan(
                        text: 'Size:   ',
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          ...List.generate(
                              model.availableSize.length,
                              (index) => TextSpan(
                                    text: "${model.availableSize[index]},  ",
                                    style: const TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 16.0,
                                    ),
                                  ))
                        ]),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Description',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    model.description ?? '',
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () async {
            BotToast.showLoading();

            var currentCart = await FirebaseFirestore.instance
                .collection("cart")
                .where(
                  "userId",
                  isEqualTo: FirebaseAuth.instance.currentUser?.uid,
                )
                .get();

            log("${currentCart.docs.firstOrNull?.id}");
            if (currentCart.docs.isEmpty) {
              FirebaseFirestore.instance.collection('cart').add({
                "userId": FirebaseAuth.instance.currentUser?.uid,
                "products": [
                  {
                    'productId': model.id,
                    'quantity': 1,
                    'price': model.price,
                  }
                ],
              });
              BotToast.closeAllLoading();
              BotToast.showText(
                  text: 'Item added to cart', contentColor: Colors.green);
              await cartProv.getCartList();
            } else {
              var products =
                  currentCart.docs.expand((e) => e["products"]).toList();
              log("$products");
              if (products
                  .where((element) => element['productId'] == model.id)
                  .isNotEmpty) {
                BotToast.closeAllLoading();
                BotToast.showText(
                    text: 'Already on cart', contentColor: Colors.red);
              } else {
                var updateData = {
                  "products": [
                    ...products,
                    {
                      'productId': model.id,
                      'quantity': 1,
                      'price': model.price,
                    }
                  ],
                };
                log("$updateData");
                FirebaseFirestore.instance
                    .collection('cart')
                    .doc(currentCart.docs.firstOrNull?.id)
                    .update(updateData);
                BotToast.closeAllLoading();
                BotToast.showText(
                    text: 'Item added to cart', contentColor: Colors.green);
                await cartProv.getCartList();
              }
            }
          },
          child: Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.all(10.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: const Center(
              child: Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ),
      );
    });
  }
}
