import 'package:booking/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


/// HotelImageCoverWidget
class HotelImageCoverWidget extends StatelessWidget {
  /// Constructor
  const HotelImageCoverWidget({
    required this.imageUrl,
    this.height = 300,
    super.key,
  });

  /// imageUrl: cover image url
  final String imageUrl;
  /// height: the image height
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (context, url) => Image.asset(
        Assets.img.loading.path,
        fit: BoxFit.cover,
        height: height,
      ),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error_outline),
    );
  }
}
