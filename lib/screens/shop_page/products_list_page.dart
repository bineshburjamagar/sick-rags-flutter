import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/core/providers/products_provider.dart';

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
            'Products',
            style: TextStyle(fontFamily: 'Caveat'),
          ),
          centerTitle: true,
        ),
        body: Container(),
      );
    });
  }
}
