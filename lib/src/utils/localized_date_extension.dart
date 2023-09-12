import 'dart:ui';

import 'package:intl/intl.dart';

extension LocalizedDate on int {
  String localizedYear(Locale locale) {
    return DateFormat.y(locale.languageCode).format(DateTime(this));
  }

  String localizedMonth(Locale locale) {
    return DateFormat.MMM(locale.languageCode).format(DateTime(0, this));
  }
}
