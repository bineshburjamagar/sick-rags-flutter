import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ClothesCardWidget extends StatelessWidget {
  const ClothesCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: CachedNetworkImage(
              height: 200,
              width: 150,
              fit: BoxFit.cover,
              imageUrl:
                  'https://scontent.fktm10-1.fna.fbcdn.net/v/t39.30808-6/350463894_1416501985868902_6715816596073242481_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=Qz5L6LVUcWMAX9BBA4h&_nc_ht=scontent.fktm10-1.fna&oh=00_AfAdXC41O6JFJPd5Bbv1xWN0SG0-AXaxyGMCGz55wvDd4w&oe=64AC25B3'),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          'Antim Grahan Hoodie',
        ),
        const Text(
          'Rs 3000',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}