import 'package:bot_toast/bot_toast.dart';
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
        children: [
          const CustomCarouselSlider(
            images: [
              'https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/318429622_637331288103259_9124934564493071457_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=hl51pbEEf3IAX94XdyV&_nc_ht=scontent.fktm10-1.fna&oh=00_AfA2xnmzNt3zhk3_uJ_AN6qugWQLuv7C1AiMpQg4KgINVw&oe=64AACC72',
              'https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/318201086_637331248103263_659258479615699600_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=xciKAjU4qsMAX-RE5_l&_nc_ht=scontent.fktm10-1.fna&oh=00_AfAibRpvwcP0WVKCAZJqu4zIcn1EJCGMTUGBuYqlmZWSxg&oe=64AC2F7C',
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                const Text(
                  'Antim Grahan Hoodie',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    const Text(
                      'Rs 3000',
                      style: TextStyle(
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
                  text: const TextSpan(
                      text: 'Size:   ',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: 'XL',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 16.0,
                          ),
                        )
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
                const Text(
                  'New limited edition NDIF merch will be available on todays show at Reggae bar ,thamel ...',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () => BotToast.showText(text: 'Item added to cart'),
        child: Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
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
  }
}
