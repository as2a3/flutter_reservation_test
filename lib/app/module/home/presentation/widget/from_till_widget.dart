import 'package:booking/app/module/home/presentation/widget/list_tile_item_widget.dart';
import 'package:booking/common/date_extension.dart';
import 'package:flutter/material.dart';

/// FromTillWidget
class FromTillWidget extends StatelessWidget {
  /// Constructor
  const FromTillWidget({
    this.from,
    this.till,
    super.key,
  });

  /// From date
  final DateTime? from;

  /// Till date
  final DateTime? till;

  @override
  Widget build(BuildContext context) {
    if (from == null && till == null) {
      return const Offstage();
    }
    return Row(
      children: [
        if (from != null) ...[
          Expanded(
            child: ListTileItemWidget(
              title: 'From',
              value: (from!).dateString,
            ),
          ),
        ],
        if (till != null) ...[
          Expanded(
            child: ListTileItemWidget(
              title: 'Till',
              value: (till!).dateString,
            ),
          ),
        ],
      ],
    );
  }
}
