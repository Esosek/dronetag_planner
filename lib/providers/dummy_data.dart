import 'package:dronetag_planner/models/flight.dart';
import 'package:dronetag_planner/models/flight_location.dart';
import 'package:dronetag_planner/models/device.dart';

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

const _dummyDevices = [
  Device(uasId: '0000512345', label: 'Millennium Falcon', isActive: false),
  Device(uasId: '00003123', label: 'Nebuchadnezzar', isActive: true),
  Device(uasId: '0000A1234567891', isActive: false),
];
