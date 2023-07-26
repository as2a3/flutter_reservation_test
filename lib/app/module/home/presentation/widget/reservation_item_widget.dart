import 'package:booking/app/module/common_widget/empty_padding_extension.dart';
import 'package:booking/app/module/home/model/reservation.dart';
import 'package:booking/app/module/home/presentation/widget/guest_item_widget.dart';
import 'package:booking/app/module/home/presentation/widget/list_tile_item_widget.dart';
import 'package:booking/app/module/home/presentation/widget/room_no_sleeps_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ReservationItemWidget
class ReservationItemWidget extends StatelessWidget {
  /// Constructor
  const ReservationItemWidget({
    required this.reservation,
    required this.index,
    super.key,
  });

  /// reservation model object
  final Reservation reservation;

  /// index of item
  final int index;

  @override
  Widget build(BuildContext context) {
    const radius = 12.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Room Reservation ${(index + 1).toString().padLeft(2, '0')}',
          maxLines: 1,
          style: Get.textTheme.headlineMedium,
        ),
        35.ph,
        ListTileItemWidget(
          title: 'Guest(s)',
          subTitleWidget: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reservation.guests.length,
            itemBuilder: (context, index) => GuestItemWidget(
              guest: reservation.guests[index],
            ),
          ),
        ),
        35.ph,
        ListTileItemWidget(
          title: 'Room Type',
          value: reservation.roomType,
        ),
        35.ph,
        RoomNumberAndSleepsWidget(
          roomNo: reservation.roomNumber,
          sleeps: reservation.sleeps,
        ),
      ],
    );
  }
}
