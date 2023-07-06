import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/config/app_colors.dart';
import 'package:sick_rags_flutter/config/assets_path.dart';

import '../../widgets/widgets.dart';

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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_checkout_sharp,
                    size: 23,
                  ),
                ),
              ),
            ],
          ),
          SliverPadding(
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
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0,
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 23.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Products',
                    style: TextStyle(fontSize: 24.0, fontFamily: 'Caveat'),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 18.0, fontFamily: 'Caveat'),
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
          SliverToBoxAdapter(
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
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0,
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 23.0),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(fontSize: 24.0, fontFamily: 'Caveat'),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 18.0, fontFamily: 'Caveat'),
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
          SliverToBoxAdapter(
            child: GridView.builder(
              padding: const EdgeInsets.only(left: 23.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 260,
              ),
              itemBuilder: (context, index) {
                return const ClothesCardWidget();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
