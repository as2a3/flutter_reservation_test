import 'package:auto_size_text/auto_size_text.dart';
import 'package:booking/app/module/common_widget/empty_padding_extension.dart';
import 'package:booking/app/module/home/model/location.dart';
import 'package:booking/app/module/home/presentation/widget/list_tile_item_widget.dart';
import 'package:booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// LocationWidget
class LocationWidget extends StatelessWidget {
  /// Constructor
  const LocationWidget({
    required this.location,
    super.key,
  });

  /// location
  final Location location;

  @override
  Widget build(BuildContext context) {
    if (!location.hasData) {
      return const Offstage();
    }
    return ListTileItemWidget(
      title: 'Location:',
      subTitleWidget: _LocationDetailsWidget(location: location),
    );
  }
}

class _LocationDetailsWidget extends StatelessWidget {
  const _LocationDetailsWidget({
    required this.location,
  });

  /// location
  final Location location;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.hintColor,
      margin: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          14.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.name,
                  style: Get.textTheme.titleLarge,
                ),
                12.ph,
                AutoSizeText(
                  'Address: ${location.address}',
                  maxLines: 2,
                  style: Get.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          8.pw,
          SizedBox(
            height: 110,
            width: 100,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(location.latitude, location.longitude),
                    zoom: 14.4746,
                  ),
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    // _controller.complete(controller);
                  },
                ),
                Align(
                  child: Image.asset(Assets.img.icon.path),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
