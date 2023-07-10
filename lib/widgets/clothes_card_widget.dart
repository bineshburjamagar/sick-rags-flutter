import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/config/assets_path.dart';
import 'package:sick_rags_flutter/core/models/models.dart';
import 'package:sick_rags_flutter/screens/nav_page/products_details_page.dart';

class ClothesCardWidget extends StatelessWidget {
  const ClothesCardWidget({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductsDetailsPage.routeName,
          arguments: model),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Hero(
                tag: 'Hero0',
                child: CachedNetworkImage(
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    AssetPath.appLogo,
                    fit: BoxFit.cover,
                  ),
                  imageUrl: model.images.firstOrNull,
                ),
              )),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Text(
              model.name ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            'Rs ${model.price}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
