import 'package:booking/app/module/home/model/guest.dart';
import 'package:booking/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// GuestItemWidget
class GuestItemWidget extends StatelessWidget {
  /// Constructor
  const GuestItemWidget({
    required this.guest,
    this.radius = 12,
    super.key,
  });

  /// guest
  final Guest guest;

  /// guest
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 12,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -4),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: CachedNetworkImage(
            height: radius * 2,
            width: radius * 2,
            fit: BoxFit.cover,
            imageUrl: guest.thumbnail,
            placeholder: (context, url) => Image.asset(
              Assets.img.loading.path,
              fit: BoxFit.cover,
              height: radius * 2,
              width: radius * 2,
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error_outline),
          ),
        ),
      ),
      title: Text(
        guest.name,
        style: Get.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
