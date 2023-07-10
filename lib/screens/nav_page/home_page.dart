import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/core/providers/base_page_provider.dart';
import 'package:sick_rags_flutter/core/providers/products_provider.dart';

import '../../config/config.dart';
import '../../core/models/models.dart';
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
    return Consumer2<BasePageProvider, ProductsProvider>(
        builder: (context, baseProv, productProv, child) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              snap: true,
              floating: true,
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    AssetPath.appLogo,
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: const Text(
                'SICK RAGS',
                style: TextStyle(fontSize: 24.0, fontFamily: 'Caveat'),
              ),
              centerTitle: true,
              actions: const [
                CartWidget(),
              ],
            ),
            _bannersAndTitle(banner: baseProv.banner ?? ''),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            if (productProv.recentProducts.isNotEmpty)
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
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: 'Caveat'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (productProv.recentProducts.isNotEmpty)
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.0,
                ),
              ),
            if (productProv.recentProducts.isNotEmpty)
              _recentProducts(recentProducts: productProv.recentProducts),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            if (productProv.popularProducts.isNotEmpty)
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
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: 'Caveat'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (productProv.popularProducts.isNotEmpty)
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.0,
                ),
              ),
            if (productProv.popularProducts.isNotEmpty)
              _popularProducts(popularProducts: productProv.popularProducts),
          ],
        ),
      );
    });
  }

  SliverPadding _bannersAndTitle({required String banner}) {
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
                child: CachedNetworkImage(
                  imageUrl: banner,
                  errorWidget: (context, url, error) => Image.asset(
                    AssetPath.appLogo,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _popularProducts(
      {required List<ProductModel> popularProducts}) {
    return SliverToBoxAdapter(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 23.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
          crossAxisSpacing: 0.0,
        ),
        itemBuilder: (context, index) {
          return Center(
              child: ClothesCardWidget(
            model: popularProducts[index],
          ));
        },
        itemCount: popularProducts.length,
      ),
    );
  }

  SliverToBoxAdapter _recentProducts(
      {required List<ProductModel> recentProducts}) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 280,
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
            return SizedBox(
              width: 180,
              child: ClothesCardWidget(
                model: recentProducts[index],
              ),
            );
          },
          itemCount: recentProducts.length,
        ),
      ),
    );
  }
}
