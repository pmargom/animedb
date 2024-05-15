import 'package:intl/intl.dart';

extension NullableDateTimeExtension on DateTime? {
  String get transforNull => this == null ? 'n/a' : this!.extraLongDateTime;
}

extension DateTimeExtension on DateTime {
  String get shortTime => DateFormat("hh:mm a").format(this);
  String get longDateTime => DateFormat.yMMMMEEEEd().format(this);
  String get extraLongDateTime => DateFormat("EEE MMM d, hh:mm a").format(this); // Tues 9th, March 14.00 PM
  String get onlyMonth => DateFormat.MMM().format(this);
  String get onlyDay => DateFormat.d().format(this);
  String get shortDate => DateFormat.yMd().format(this);
  String get onlyDate => DateFormat("y-MM-dd").format(this);
  String get onlyDateForAccess => DateFormat("dd MMM y").format(this);
}
