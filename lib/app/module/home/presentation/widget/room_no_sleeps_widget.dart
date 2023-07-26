import 'package:booking/app/module/home/presentation/widget/list_tile_item_widget.dart';
import 'package:flutter/material.dart';

/// RoomNumberAndSleepsWidget
class RoomNumberAndSleepsWidget extends StatelessWidget {
  /// Constructor
  const RoomNumberAndSleepsWidget({
    this.roomNo = '',
    this.sleeps = 0,
    super.key,
  });

  /// roomNo: Room number
  final String roomNo;

  /// sleeps: number of sleeps
  final int sleeps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTileItemWidget(
            title: 'Room Number',
            value: roomNo,
          ),
        ),
        Expanded(
          child: ListTileItemWidget(
            title: 'Sleeps',
            value: sleeps.toString(),
          ),
        ),
      ],
    );
  }
}
