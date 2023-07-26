import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ListTileItemWidget
class ListTileItemWidget extends StatelessWidget {
  /// Constructor
  const ListTileItemWidget({
    required this.title,
    this.value = '',
    this.subTitleWidget,
    this.valueMaxLines = 1,
    super.key,
  });

  /// title: required for item title
  final String title;

  /// value: item value
  final String value;

  /// valueMaxLines
  final int? valueMaxLines;

  /// subTitleWidget: If the sub title does not a text
  final Widget? subTitleWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        title,
        maxLines: 1,
        style: Get.textTheme.headlineMedium,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: subTitleWidget ??
            AutoSizeText(
              value,
              maxLines: valueMaxLines,
              style: Get.textTheme.titleSmall,
            ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
