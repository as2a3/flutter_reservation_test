import 'package:booking/app/module/common_widget/empty_padding_extension.dart';
import 'package:booking/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// GalleryWidget
class GalleryWidget extends StatelessWidget {
  /// Constructor
  const GalleryWidget({
    required this.images,
    super.key,
  });

  /// images: urls
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    const height = 225.0;
    const width = 150.0;
    return SizedBox(
      height: height,
      width: width,
      child: ListView.separated(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CachedNetworkImage(
          height: height,
          width: width,
          fit: BoxFit.cover,
          imageUrl: images[index],
          placeholder: (context, url) => Image.asset(
            Assets.img.loading.path,
            fit: BoxFit.cover,
            height: height,
            width: width,
          ),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error_outline),
        ),
        separatorBuilder: (context, index) => 6.pw,
      ),
    );
  }
}
