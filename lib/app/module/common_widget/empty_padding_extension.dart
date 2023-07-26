import 'package:flutter/material.dart';

/// EmptyPadding
extension EmptyPadding on num {
  /// height padding
  SizedBox get ph => SizedBox(height: toDouble(),);

  /// width padding
  SizedBox get pw => SizedBox(width: toDouble(),);
}
