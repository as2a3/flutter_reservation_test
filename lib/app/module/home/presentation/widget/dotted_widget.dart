import 'package:booking/app/module/common_widget/empty_padding_extension.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// DottedWidget
class DottedWidget extends StatelessWidget {
  /// Constructor
  const DottedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.ph,
        DottedLine(
          dashColor: Get.theme.hintColor,
          dashLength: 5,
          dashGapColor: Get.theme.scaffoldBackgroundColor,
          dashGapLength: 5,
          lineThickness: 2,
        ),
        40.ph,
      ],
    );
  }
}
