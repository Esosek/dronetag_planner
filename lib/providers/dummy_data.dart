// ignore_for_file: unused_element

import 'package:dronetag_planner/models/flight.dart';
import 'package:dronetag_planner/models/flight_location.dart';
import 'package:dronetag_planner/models/device.dart';

final _dummyFlights = [
  Flight(
    device: const Device(uasId: '00003123', label: 'Nebuchadnezzar'),
    location:
        const FlightLocation(latitude: 49.190, longitude: 16.550, radius: 20),
    altitudeRange: [0, 15],
    dateStart: DateTime(2023, 11, 28, 12, 13, 14),
    dateEnd: DateTime(2023, 11, 28, 12, 33, 14),
  ),
  Flight(
    device: const Device(uasId: '00003123', label: 'Nebuchadnezzar'),
    location:
        const FlightLocation(latitude: 49.050, longitude: 16.050, radius: 200),
    altitudeRange: [0, 25],
    dateStart: DateTime(2023, 11, 27, 12, 13, 14),
    dateEnd: DateTime(2023, 11, 27, 12, 33, 14),
  ),
  Flight(
    device: const Device(uasId: '0000A1234567891'),
    location:
        const FlightLocation(latitude: 49.190, longitude: 16.550, radius: 20),
    altitudeRange: [0, 15],
    dateStart: DateTime(2023, 11, 28, 12, 13, 14),
    dateEnd: DateTime(2023, 11, 28, 12, 33, 14),
  ),
];

const _dummyDevices = [
  Device(uasId: '0000512345', label: 'Millennium Falcon', isActive: false),
  Device(uasId: '00003123', label: 'Nebuchadnezzar', isActive: true),
  Device(uasId: '0000A1234567891', isActive: false),
];
