import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/config/app_colors.dart';
import 'package:sick_rags_flutter/config/assets_path.dart';
import 'package:sick_rags_flutter/core/models/models.dart';
import 'package:sick_rags_flutter/core/providers/providers.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<OrdersProvider, ProductsProvider>(
        builder: (context, orderProv, prodProv, child) {
      return Scaffold(
        appBar: AppBar(
          leading: const Text(''),
          title: const Text(
            'My Orders',
            style: TextStyle(fontSize: 24.0, fontFamily: 'Caveat'),
          ),
        ),
        body: SingleChildScrollView(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20.0,
            ),
            itemBuilder: (context, index) {
              ProductModel productModel = prodProv.productsList
                  .where((element) =>
                      element.id == orderProv.orderList[index].productId)
                  .first;
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.borderColor),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedNetworkImage(
                        height: 100,
                        width: 100,
                        imageUrl: productModel.images.firstOrNull,
                        errorWidget: (context, url, error) =>
                            Image.asset(AssetPath.appLogo),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${productModel.name}'),
                        Text('x ${orderProv.orderList[index].quantity}'),
                        Text('Rs ${orderProv.orderList[index].price}')
                      ],
                    )),
                  ],
                ),
              );
            },
            itemCount: orderProv.orderList.length,
          ),
        ),
      );
    });
  }
}
