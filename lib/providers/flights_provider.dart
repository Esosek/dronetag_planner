import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:dronetag_planner/models/flight.dart';
import 'package:dronetag_planner/utility/custom_logger.dart';

class FlightsProvider extends StateNotifier<List<Flight>> {
  FlightsProvider() : super([]);

  final log = CustomLogger('FlightsProvider');

  // returns null if successfull
  // returns error message otherwise
  Future<String?> addFlight(Flight flight) async {
    final result = await _postFlight(flight);
    if (result != null) {
      return result;
    }

    state = [...state, flight];
    log.trace(
        'Added new Flight UAS ID:${flight.device.uasId}, Lat:${flight.location.latitude.toString()}, Lng:${flight.location.longitude.toString()}, Radius:${flight.location.radius}, Altitude:${flight.altitudeRange[0]}-${flight.altitudeRange[1]}, Date Start:${flight.dateStart}, Date End:${flight.dateEnd}');
    return null;
  }

  // returns message when failed and null when successful
  Future<String?> _postFlight(Flight flight) async {
    final requestData = {
      'uas_id': flight.device.uasId,
      'location': {
        'latitude': flight.location.latitude,
        'longitude': flight.location.longitude,
        'radius': flight.location.radius,
      },
      'altitude': {
        'min': flight.altitudeRange[0],
        'max': flight.altitudeRange[1],
      },
      'date_start': flight.dateStart,
      'date_end': flight.dateEnd,
    };
    try {
      final url = Uri.parse('http://10.0.2.2:3013/plan');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );

      // fetches error message when request failed
      if (response.statusCode != 200) {
        final responseBody = jsonDecode(response.body);
        log.trace(
            'Saving flight failed with code ${response.statusCode}: ${responseBody['error_message']}');
        return responseBody['error_message'];
      }

      return null;
    } catch (error) {
      log.error(error.toString());
      return 'Service is down. Please try again later.';
    }
  }
}

final flightsProvider = StateNotifierProvider<FlightsProvider, List<Flight>>(
    (ref) => FlightsProvider());
