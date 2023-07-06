import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/config/app_colors.dart';
import 'package:sick_rags_flutter/config/assets_path.dart';

import '../../widgets/widgets.dart';
import '../shop_page/shop_page.dart';

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
            backgroundColor: Colors.white,
            snap: true,
            floating: true,
            leading: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Icon(
                Icons.menu_open_sharp,
                size: 30,
              ),
            ),
            actions: [
              Badge(
                alignment: Alignment.bottomLeft,
                label: const Text('1'),
                backgroundColor: AppColors.primaryColor,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartPage.routeName);
                  },
                  icon: const Icon(
                    Icons.shopping_cart_checkout_sharp,
                    size: 23,
                  ),
                ),
              ),
            ],
          ),
          _bannersAndTitle(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Products',
                    style: TextStyle(fontSize: 24.0, fontFamily: 'Caveat'),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ProductsListPage.routeName),
                    child: const Text(
                      'View All',
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Caveat'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          _recentProducts(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Products',
                    style: TextStyle(fontSize: 24.0, fontFamily: 'Caveat'),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ProductsListPage.routeName),
                    child: const Text(
                      'View All',
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Caveat'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          _popularProducts(),
        ],
      ),
    );
  }

  SliverPadding _bannersAndTitle() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 23.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find Your Clothes,',
              style: TextStyle(fontSize: 28, fontFamily: 'Caveat'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  AssetPath.banner,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _popularProducts() {
    return SliverToBoxAdapter(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 23.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 260,
          crossAxisSpacing: 0.0,
        ),
        itemBuilder: (context, index) {
          return const Center(child: ClothesCardWidget());
        },
        itemCount: 10,
      ),
    );
  }

  SliverToBoxAdapter _recentProducts() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250,
        child: ListView.separated(
          padding: const EdgeInsets.only(left: 23.0),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemBuilder: (context, index) {
            return const ClothesCardWidget();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
