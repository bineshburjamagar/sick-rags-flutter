import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider(
      {super.key, required this.heroTag, required this.images});
  final List<dynamic> images;
  final String heroTag;
  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: [
            ...List.generate(
              widget.images.length,
              (index) => Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: widget.images[index],
                  errorWidget: (context, url, error) =>
                      Image.asset(AssetPath.appLogo),
                ),
              ),
            )
          ],
          options: CarouselOptions(
            height: 350,
            aspectRatio: double.infinity,
            autoPlay: false,
            viewportFraction: 1,
            onPageChanged: (i, reason) {
              index = i;
              setState(() {});
            },
          ),
        ),
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (e) => Container(
                  width: (index == e) ? 16 : 6.0,
                  height: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: (index == e) ? AppColors.primaryColor : Colors.white,
                    borderRadius:
                        (index == e) ? BorderRadius.circular(4.0) : null,
                    shape: (index == e) ? BoxShape.rectangle : BoxShape.circle,
                  ),
                ),
              ).toList(),
            ))
      ],
    );
  }
}
