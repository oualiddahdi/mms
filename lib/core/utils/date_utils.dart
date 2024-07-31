import 'package:intl/intl.dart';

// Function to format a DateTime object to a specific string format
String formatDate(String dateString, {String format = 'MM/dd/yyyy hh:mm a'}) {
  // Convert the string to DateTime
  DateTime date = DateTime.parse(dateString);
  final DateFormat formatter = DateFormat(format);
  return formatter.format(date);
}
