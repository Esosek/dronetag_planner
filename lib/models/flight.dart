import 'package:dronetag_planner/models/flight_location.dart';

class Flight {
  const Flight({
    required this.uasId,
    required this.location,
    required this.altitudeRange,
    required this.dateStart,
    required this.dateEnd,
  });

  final String uasId;
  final FlightLocation location;
  final List<int> altitudeRange;
  final String dateStart;
  final String dateEnd;
}
