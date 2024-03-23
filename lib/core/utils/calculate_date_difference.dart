import 'package:easy_localization/easy_localization.dart';

class CalculateDateDifference {
  Duration calculateDateDifference(String startDateStr, String finishDateStr) {
    DateTime startDate = DateFormat("MMM d, yyyy").parse(startDateStr);
    DateTime finishDate = DateFormat("MMM d, yyyy").parse(finishDateStr);
    Duration difference = finishDate.difference(startDate);
    return difference;
  }
}
