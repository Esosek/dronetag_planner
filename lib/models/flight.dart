import 'package:dronetag_planner/models/device.dart';
import 'package:dronetag_planner/models/flight_location.dart';

class Flight {
  const Flight({
    required this.device,
    required this.location,
    required this.altitudeRange,
    required this.dateStart,
    required this.dateEnd,
  });

  final Device device;
  final FlightLocation location;
  final List<int> altitudeRange;
  final DateTime dateStart;
  final DateTime dateEnd;

  String get formattedDate {
    String formattedStart = formatDateTime(dateStart);
    String formattedEnd = formatDateTime(dateEnd, includeDate: false);
    return '$formattedStart - $formattedEnd';
  }

  String formatDateTime(DateTime dateTime, {bool includeDate = true}) {
    String formattedTime =
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

    if (includeDate) {
      return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}, $formattedTime';
    } else {
      return formattedTime;
    }
  }
}
