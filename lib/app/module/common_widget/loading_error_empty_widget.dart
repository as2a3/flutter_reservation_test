import 'package:booking/app/module/common_widget/loading_error_widget.dart';
import 'package:booking/app/module/common_widget/no_data_found_widget.dart';
import 'package:flutter/material.dart';

/// LoadingErrorEmptyWidget
class LoadingErrorEmptyWidget extends StatelessWidget {
  /// Constructor
  const LoadingErrorEmptyWidget({
    required this.child,
    this.isLoading = false,
    this.isLoadingError = false,
    this.errorText = '',
    this.isEmptyData = false,
    this.retryAction,
    this.emptyWidget,
    this.noDataText,
    super.key,
  });

  /// isLoading
  final bool isLoading;

  /// isLoadingError
  final bool isLoadingError;

  /// errorText
  final String errorText;

  /// noDataText
  final String? noDataText;

  /// isEmptyData
  final bool isEmptyData;

  /// retryAction
  final VoidCallback? retryAction;

  /// child
  final Widget child;

  /// emptyWidget
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    if (isLoadingError) {
      return LoadingErrorWidget(
        msg: errorText,
        retryAction: () => retryAction?.call(),
      );
    }
    if (isEmptyData) {
      return emptyWidget ??
          NoDataFoundWidget(
            refreshAction: retryAction,
            msg: noDataText ?? '',
          );
    }
    return child;
  }
}
