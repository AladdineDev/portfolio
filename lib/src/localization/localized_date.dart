import 'dart:ui';

import 'package:intl/intl.dart';

extension LocalizedYear on int {
  String localizedYear(Locale locale) {
    return DateFormat.y(locale.languageCode).format(DateTime(this));
  }
}
