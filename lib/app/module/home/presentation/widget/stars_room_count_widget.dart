import 'package:booking/app/module/home/presentation/widget/list_tile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/// StarsRoomCountWidget
class StarsRoomCountWidget extends StatelessWidget {
  /// Constructor
  const StarsRoomCountWidget({
    this.stars = 0,
    this.roomCount = 0,
    super.key,
  });

  /// stars
  final double stars;

  /// roomCount
  final int roomCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTileItemWidget(
            title: 'Stars',
            subTitleWidget: RatingBar(
              initialRating: stars,
              allowHalfRating: true,
              itemSize: 18,
              ratingWidget: RatingWidget(
                full: const Icon(Icons.star, color: Color(0xFFFFD979)),
                half: const Icon(
                  Icons.star_half,
                  color: Color(0xFFFFD979),
                ),
                empty: const Icon(
                  Icons.star_outline,
                  color: Color(0xFFFFD979),
                ),
              ),
              onRatingUpdate: (value) {},
            ),
          ),
        ),
        if (roomCount > 0) ...[
          Expanded(
            child: ListTileItemWidget(
              title: 'Room Count',
              value: roomCount.toString(),
            ),
          ),
        ],
      ],
    );
  }
}
