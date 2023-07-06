import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../widgets/widgets.dart';

class ProductsDetailsPage extends StatelessWidget {
  const ProductsDetailsPage({Key? key}) : super(key: key);
  static const String routeName = "/productsdetailspage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ProductsDetailsPage());
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          Badge(
            alignment: Alignment.bottomLeft,
            label: const Text('1'),
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_checkout_sharp,
                color: AppColors.primaryColor,
                size: 23,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          CustomCarouselSlider(images: [
            'https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/318429622_637331288103259_9124934564493071457_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=hl51pbEEf3IAX94XdyV&_nc_ht=scontent.fktm10-1.fna&oh=00_AfA2xnmzNt3zhk3_uJ_AN6qugWQLuv7C1AiMpQg4KgINVw&oe=64AACC72',
            'https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/318201086_637331248103263_659258479615699600_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=xciKAjU4qsMAX-RE5_l&_nc_ht=scontent.fktm10-1.fna&oh=00_AfAibRpvwcP0WVKCAZJqu4zIcn1EJCGMTUGBuYqlmZWSxg&oe=64AC2F7C',
          ]),
        ],
      ),
    );
  }
}
