import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/config/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = "/homepage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Builder(builder: (context) {
              return InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  Icons.menu_open_sharp,
                  size: 30,
                ),
              );
            }),
            actions: [
              Badge(
                alignment: Alignment.bottomLeft,
                label: const Text('1'),
                backgroundColor: AppColors.primaryColor,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_checkout_sharp,
                    size: 23,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
