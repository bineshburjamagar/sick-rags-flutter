import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/core/providers/products_provider.dart';
import 'package:sick_rags_flutter/widgets/clothes_card_widget.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({Key? key}) : super(key: key);
  static const String routeName = "/productslistpage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ProductsListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(builder: (context, productProv, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'All Products',
            style: TextStyle(fontFamily: 'Caveat', fontSize: 24.0),
          ),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 280,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return Center(
                child: ClothesCardWidget(
              model: productProv.productsList[index],
            ));
          },
          itemCount: productProv.productsList.length,
        ),
      );
    });
  }
}
