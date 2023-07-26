import 'package:booking/app/module/common_widget/empty_padding_extension.dart';
import 'package:booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// NoDataFoundWidget
class NoDataFoundWidget extends StatelessWidget {
  /// Constructor
  const NoDataFoundWidget({
    super.key,
    this.msg = '',
    this.size = 100,
    this.refreshAction,
  });

  /// msg
  final String msg;

  /// size
  final double size;

  /// refreshAction
  final VoidCallback? refreshAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        // color: Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  Assets.img.noData.path,
                ),
                width: size,
              ),
              16.ph,
              Text(
                msg.isNotEmpty ? msg : 'No data found'.tr,
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              16.ph,
              if (refreshAction != null) ...[
                ElevatedButton(
                  onPressed: refreshAction?.call,
                  child: Text(
                    'Retry',
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
