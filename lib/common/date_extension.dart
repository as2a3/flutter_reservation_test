import 'package:intl/intl.dart';

/// DateExtension
extension DateExtension on DateTime {

  /// return date in string
  String get dateString => DateFormat('MMM dd, yyyy').format(this);

  /// return date in string depends on format
  String dateFormatString(String format) => DateFormat(format).format(this);
}
