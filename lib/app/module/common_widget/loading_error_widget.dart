import 'package:booking/app/module/common_widget/empty_padding_extension.dart';
import 'package:booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// LoadingErrorWidget
class LoadingErrorWidget extends StatelessWidget {
  /// Constructor
  const LoadingErrorWidget({
    super.key,
    this.msg = '',
    this.retryAction,
  });

  /// msg
  final String msg;

  /// retryAction
  final VoidCallback? retryAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(
          16,
        ),
        elevation: 8,
        // color: Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Assets.img.loadingError.path),
                width: Get.width * 0.2,
              ),
              16.ph,
              Text(
                msg != '' ? msg : 'Default Error Message'.tr,
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              8.ph,
              if (retryAction != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(),
                    ElevatedButton(
                      child: Text('Retry'.tr),
                      onPressed: () => retryAction?.call(),
                      // textColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
