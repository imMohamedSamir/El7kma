import 'package:intl/intl.dart';

String fromatDate({required String value}) {
  DateTime dateTime = DateTime.parse(value);
  String formattedDate =
      DateFormat('h:mm a - EEEE - yyyy/M/d ', 'ar').format(dateTime);
  return formattedDate;
}
