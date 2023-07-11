import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/core/models/models.dart';
import 'package:sick_rags_flutter/core/providers/providers.dart';

import '../config/config.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.productModel,
    required this.quantity,
  });
  final ProductModel productModel;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProve, child) {
      return Container(
        padding: const EdgeInsets.only(bottom: 20),
        height: 160,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                height: 150,
                width: 120,
                fit: BoxFit.cover,
                imageUrl: productModel.images.firstOrNull,
                errorWidget: (context, url, error) =>
                    Image.asset(AssetPath.appLogo),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.name ?? '',
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Rs ${productModel.price} ',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => updateQuantity(
                              isIncrease: true,
                              lastCall: () async {
                                await cartProve.getCartList();
                              }),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 1.5),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () => updateQuantity(
                              isIncrease: false,
                              lastCall: () async {
                                await cartProve.getCartList();
                              }),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 1.5),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 16.0,
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            var currentCart = await FirebaseFirestore.instance
                                .collection("cart")
                                .where(
                                  "userId",
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser?.uid,
                                )
                                .get();

                            var products = currentCart.docs
                                .expand((e) => e["products"])
                                .toList();

                            log("Original $products");

                            if (products.length <= 1) {
                              FirebaseFirestore.instance
                                  .collection('cart')
                                  .doc(currentCart.docs.firstOrNull?.id)
                                  .delete();
                            } else {
                              products.removeWhere((element) =>
                                  element["productId"] == productModel.id);

                              log("$products");

                              var updateData = {
                                "products": [...products],
                              };

                              FirebaseFirestore.instance
                                  .collection('cart')
                                  .doc(currentCart.docs.firstOrNull?.id)
                                  .update(updateData);
                            }

                            await cartProve.getCartList();
                            // }
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  updateQuantity(
      {required bool isIncrease, required VoidCallback lastCall}) async {
    var currentCart = await FirebaseFirestore.instance
        .collection("cart")
        .where(
          "userId",
          isEqualTo: FirebaseAuth.instance.currentUser?.uid,
        )
        .get();

    var products = currentCart.docs.expand((e) => e["products"]).toList();

    for (var element in products) {
      if (element["productId"] == productModel.id) {
        if (isIncrease) {
          element["quantity"] = quantity + 1;
        } else {
          if (quantity > 1) {
            element["quantity"] = quantity - 1;
          }
        }
      }
    }

    var updateData = {
      "products": [...products],
    };

    FirebaseFirestore.instance
        .collection('cart')
        .doc(currentCart.docs.firstOrNull?.id)
        .update(updateData);
    lastCall.call();
  }
}
