import 'package:dronetag_planner/models/device.dart';
import 'package:dronetag_planner/utility/custom_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/models/flight.dart';
import 'package:dronetag_planner/models/flight_location.dart';

const _dummyFlights = [
  Flight(
    device: Device(uasId: '00003123', label: 'Nebuchadnezzar'),
    location: FlightLocation(latitude: 49.190, longitude: 16.550, radius: 20),
    altitudeRange: [0, 15],
    dateStart: '2023-11-28T12:13:14Z',
    dateEnd: '2023-11-28T12:33:14Z',
  ),
  Flight(
    device: Device(uasId: '00003123', label: 'Nebuchadnezzar'),
    location: FlightLocation(latitude: 49.050, longitude: 16.050, radius: 200),
    altitudeRange: [0, 25],
    dateStart: '2023-11-27T12:13:14Z',
    dateEnd: '2023-11-27T12:33:14Z',
  ),
  Flight(
    device: Device(uasId: '0000A1234567891'),
    location: FlightLocation(latitude: 49.190, longitude: 16.550, radius: 20),
    altitudeRange: [0, 15],
    dateStart: '2023-11-28T12:13:14Z',
    dateEnd: '2023-11-28T12:33:14Z',
  ),
];

class FlightsProvider extends StateNotifier<List<Flight>> {
  FlightsProvider() : super(_dummyFlights);

  final log = CustomLogger('FlightsProvider');

  // returns null if successfull
  // returns error message otherwise
  Future<String?> addFlight(Flight flight) async {
    // TODO: Send flight to server
    state = [...state, flight];
    log.debug(
        'Added new Flight UAS ID:${flight.device.uasId}, Lat:${flight.location.latitude.toString()}, Lng:${flight.location.longitude.toString()}, Radius:${flight.location.radius}, Altitude:${flight.altitudeRange[0]}-${flight.altitudeRange[1]}, Date Start:${flight.dateStart}, Date End:${flight.dateEnd}');
    return null;
  }
}

final flightsProvider = StateNotifierProvider<FlightsProvider, List<Flight>>(
    (ref) => FlightsProvider());
