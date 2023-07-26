import 'package:booking/app/module/home/model/reservation.dart';
import 'package:booking/app/module/home/presentation/widget/dotted_widget.dart';
import 'package:booking/app/module/home/presentation/widget/reservation_item_widget.dart';
import 'package:flutter/material.dart';

/// ReservationsWidget
class ReservationsWidget extends StatelessWidget {
  /// Constructor
  const ReservationsWidget({
    required this.reservations,
    super.key,
  });

  /// reservations list
  final List<Reservation> reservations;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reservations.length,
      itemBuilder: (context, index) => ReservationItemWidget(
        reservation: reservations[index],
        index: index,
      ),
      separatorBuilder: (context, index) => const DottedWidget(),
    );
  }
}
