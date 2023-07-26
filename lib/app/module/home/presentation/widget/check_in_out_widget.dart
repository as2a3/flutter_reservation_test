import 'package:booking/app/module/home/presentation/widget/list_tile_item_widget.dart';
import 'package:booking/common/date_extension.dart';
import 'package:flutter/material.dart';

/// CheckInOutWidget
class CheckInOutWidget extends StatelessWidget {
  /// Constructor
  const CheckInOutWidget({
    this.checkIn,
    this.checkOut,
    super.key,
  });

  /// checkIn date
  final DateTime? checkIn;

  /// checkOut date
  final DateTime? checkOut;

  @override
  Widget build(BuildContext context) {
    if (checkIn == null && checkOut == null) {
      return const Offstage();
    }
    return Row(
      children: [
        if (checkIn != null) ...[
          Expanded(
            child: ListTileItemWidget(
              title: 'Check-in Time',
              value: (checkIn!).dateString,
            ),
          ),
        ],
        if (checkOut != null) ...[
          Expanded(
            child: ListTileItemWidget(
              title: 'Check-out Time',
              value: (checkOut!).dateString,
            ),
          ),
        ],
      ],
    );
  }
}
