import 'package:intl/intl.dart';

class DateUtil {

  static final DateFormat parsingDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  static DateTime parseDate(String dateStr) {
    if (dateStr == null)
      return null;
    return parsingDateFormat.parse(dateStr);
  }

  static String toDateStr(DateTime date) {
    if (date == null)
      return null;
    return parsingDateFormat.format(date);
  }


}