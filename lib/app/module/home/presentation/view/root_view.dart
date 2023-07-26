import 'package:booking/app/module/common_widget/empty_padding_extension.dart';
import 'package:booking/app/module/common_widget/expanded_section.dart';
import 'package:booking/app/module/common_widget/loading_error_empty_widget.dart';
import 'package:booking/app/module/home/model/booking.dart';
import 'package:booking/app/module/home/presentation/controller/root_controller.dart';
import 'package:booking/app/module/home/presentation/widget/check_in_out_widget.dart';
import 'package:booking/app/module/home/presentation/widget/dotted_widget.dart';
import 'package:booking/app/module/home/presentation/widget/from_till_widget.dart';
import 'package:booking/app/module/home/presentation/widget/gallery_widget.dart';
import 'package:booking/app/module/home/presentation/widget/guest_item_widget.dart';
import 'package:booking/app/module/home/presentation/widget/hotel_image_cover_widget.dart';
import 'package:booking/app/module/home/presentation/widget/list_tile_item_widget.dart';
import 'package:booking/app/module/home/presentation/widget/location_widget.dart';
import 'package:booking/app/module/home/presentation/widget/reservations_widget.dart';
import 'package:booking/app/module/home/presentation/widget/stars_room_count_widget.dart';
import 'package:booking/app/module/home/presentation/widget/tickets_widget.dart';
import 'package:booking/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as mbs;

/// RootView: Main app view
class RootView extends GetView<RootController> {
  /// Constructor
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Bottom Sheet',
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed: controller.changeSystemMode,
              icon: Icon(
                controller.isDarkMode.isTrue
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Obx(
          () => LoadingErrorEmptyWidget(
            isLoading: controller.loading.isTrue,
            isLoadingError: controller.loadingError.isTrue,
            errorText: controller.loadingErrorMessage.value,
            isEmptyData: controller.bookings.isEmpty,
            retryAction: controller.getData,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => _showSingleBottomSheet(
                    context: context,
                    booking: controller.bookings.first,
                  ),
                  child: const Text('Single'),
                ),
                16.ph,
                ElevatedButton(
                  onPressed: () => _showMultipleBottomSheet(
                    context: context,
                    booking: controller.bookings.first,
                  ),
                  child: const Text('Multi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showSingleBottomSheet({
    required BuildContext context,
    required Booking booking,
  }) async {
    await mbs.showMaterialModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: SafeArea(
          child: ColoredBox(
            color: Get.theme.scaffoldBackgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// The hotel image cover
                HotelImageCoverWidget(imageUrl: booking.hotel.cover),
                30.ph,

                /// Data
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hotel Check-in',
                        style: Get.textTheme.displayLarge,
                      ),
                      8.ph,
                      Text(
                        booking.title,
                        style: Get.textTheme.titleSmall,
                      ),
                      40.ph,

                      /// From and Till widgets
                      FromTillWidget(
                        from: booking.from,
                        till: booking.to,
                      ),

                      /// Stars and RoomCount Widgets
                      StarsRoomCountWidget(
                        stars: booking.hotel.stars,
                        roomCount: booking.rooms,
                      ),

                      /// Location
                      LocationWidget(location: booking.hotel.location),
                      40.ph,

                      /// TicketsWidget
                      TicketsWidget(tickets: booking.tickets),

                      const DottedWidget(),

                      /// ReservationsWidget
                      ReservationsWidget(reservations: booking.reservations),

                      const DottedWidget(),

                      /// Check In and Check Out widgets
                      CheckInOutWidget(
                        checkIn: booking.checkIn,
                        checkOut: booking.checkOut,
                      ),

                      /// Description
                      ListTileItemWidget(
                        title: 'Description',
                        value: booking.description,
                        valueMaxLines: null,
                      ),
                      40.ph,

                      /// Gallery
                      ListTileItemWidget(
                        title: 'Gallery:',
                        subTitleWidget: GalleryWidget(images: booking.gallery),
                      ),
                      40.ph,

                      /// Amenities
                      ListTileItemWidget(
                        title: 'Amenities:',
                        value: booking.amenities,
                        valueMaxLines: null,
                      ),
                      40.ph,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMultipleBottomSheet({
    required BuildContext context,
    required Booking booking,
  }) async {
    await mbs.showMaterialModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: SafeArea(
          child: ColoredBox(
            color: Get.theme.scaffoldBackgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// The hotel image cover
                HotelImageCoverWidget(imageUrl: booking.hotel.cover),
                30.ph,

                /// Data
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hotel Check-in',
                        style: Get.textTheme.displayLarge,
                      ),
                      8.ph,
                      Text(
                        'Multiple Reservations',
                        style: Get.textTheme.titleSmall,
                      ),
                      40.ph,
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: booking.reservations.length,
                        itemBuilder: (context, index) => _TileExpandedWidget(
                          booking: booking,
                        ),
                        separatorBuilder: (context, index) => 12.ph,
                      ),
                      40.ph,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TileExpandedWidget extends StatefulWidget {
  const _TileExpandedWidget({
    required this.booking,
  });

  /// booking
  final Booking booking;

  @override
  State<_TileExpandedWidget> createState() => _TileExpandedWidgetState();
}

class _TileExpandedWidgetState extends State<_TileExpandedWidget> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    const radius = 12.0;
    return Container(
      color: Get.theme.hintColor.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            leading: RotationTransition(
              turns: AlwaysStoppedAnimation(expanded ? 270 / 360 : 90 / 360),
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
            ),
            minLeadingWidth: 12,
            title: Text(
              'Hotel Name',
              style: Get.textTheme.headlineMedium,
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: radius,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(radius)),
                child: CachedNetworkImage(
                  height: radius * 2,
                  width: radius * 2,
                  fit: BoxFit.cover,
                  imageUrl:
                      widget.booking.reservations.first.guests.first.thumbnail,
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
            contentPadding: EdgeInsets.zero,
          ),
          ExpandedSection(
            expand: expanded,
            child: Column(
              children: [

                const Divider(
                  height: 12,
                  thickness: 1,
                ),

                35.ph,
                ListTileItemWidget(
                  title: 'Guest:',
                  subTitleWidget: GuestItemWidget(
                    guest: widget.booking.reservations.first.guests.first,
                  ),
                ),
                35.ph,

                /// From and Till widgets
                FromTillWidget(
                  from: widget.booking.from,
                  till: widget.booking.to,
                ),

                /// Stars and RoomCount Widgets
                StarsRoomCountWidget(
                  stars: widget.booking.hotel.stars,
                  roomCount: widget.booking.rooms,
                ),

                /// Location
                LocationWidget(location: widget.booking.hotel.location),
                40.ph,

                /// TicketsWidget
                TicketsWidget(tickets: widget.booking.tickets),

                const DottedWidget(),

                /// ReservationsWidget
                ReservationsWidget(reservations: widget.booking.reservations),

                const DottedWidget(),

                /// Check In and Check Out widgets
                CheckInOutWidget(
                  checkIn: widget.booking.checkIn,
                  checkOut: widget.booking.checkOut,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
