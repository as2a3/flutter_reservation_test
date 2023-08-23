import 'package:booking/app/module/common_widget/empty_padding_extension.dart';
import 'package:booking/app/module/common_widget/expanded_section.dart';
import 'package:booking/app/module/home/model/booking.dart';
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
import 'package:booking/app2/module/home/bloc/home_bloc.dart';
import 'package:booking/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as mbs;

///
class HomePage extends StatefulWidget {
  ///
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Bottom Sheet',
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (ctx, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ErrorState) {
            return Center(child: Text(state.error));
          }
          if (state is SuccessState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => _showSingleBottomSheet(
                    context: context,
                    booking: state.items.first,
                  ),
                  child: const Text('Single'),
                ),
                16.ph,
                ElevatedButton(
                  onPressed: () => _showMultipleBottomSheet(
                    context: context,
                    booking: state.items.first,
                  ),
                  child: const Text('Multi'),
                ),
              ],
            );
          }
          return const Text('Init');
        },
      ),
    );
  }

  Future<void> _showSingleBottomSheet({
    required BuildContext context,
    required Booking booking,
  }) async {
    final barrierColor = Colors.black.withOpacity(0.8);
    await mbs.showMaterialModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: barrierColor,
      builder: (context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Opacity(
              opacity: 0.80,
              child: Container(
                width: double.infinity,
                height: 30,
                decoration: const ShapeDecoration(
                  color: Color(0xFF938F93),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 53,
                    height: 6,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ColoredBox(
                color: Colors.white,
                child: ListView(
                  children: [
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
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          8.ph,
                          Text(
                            booking.title,
                            style: Theme.of(context).textTheme.titleSmall,
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
                          ReservationsWidget(
                            reservations: booking.reservations,
                          ),

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
                            subTitleWidget: GalleryWidget(
                              images: booking.gallery,
                            ),
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
          ],
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
            color: Theme.of(context).scaffoldBackgroundColor,
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
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      8.ph,
                      Text(
                        'Multiple Reservations',
                        style: Theme.of(context).textTheme.titleSmall,
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
      color: Theme.of(context).hintColor.withOpacity(0.3),
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
              style: Theme.of(context).textTheme.headlineMedium,
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
