import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              imageUrl:
                  'https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/318201086_637331248103263_659258479615699600_n.jpg?stp=dst-jpg_s600x600&_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=xciKAjU4qsMAX-RE5_l&_nc_ht=scontent.fktm10-1.fna&oh=00_AfDQGGlioyg7_TZTly17s9aujL1Am_ZBd_pGP5HFGDgaJA&oe=64AC2F7C',
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
                  const Text(
                    'Data sdfhsodihfd oih ergewrg wtrwetr ewwet ewte',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'Size: XL',
                    style: TextStyle(
                      color: AppColors.greyColor,
                    ),
                  ),
                  const Text(
                    'Rs 1000',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
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
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
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
                      const Spacer(),
                      const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 20.0,
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
  }
}
