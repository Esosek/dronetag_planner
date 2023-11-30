import 'package:flutter/material.dart';

import 'package:dronetag_planner/models/flight.dart';
import 'package:dronetag_planner/components/flight/flight_item_tile.dart';

class FlightItem extends StatelessWidget {
  const FlightItem(this.flight, {super.key});

  final Flight flight;

  @override
  Widget build(BuildContext context) {
    final deviceName = flight.device.label == null
        ? flight.device.uasId
        : '${flight.device.label} (${flight.device.uasId})';

    final originCoordinates =
        'Lat: ${flight.location.latitude}, Lng: ${flight.location.longitude}';

    final altitude = '${flight.altitudeRange[0]} - ${flight.altitudeRange[1]}m';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              flight.formattedDate,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 15),
            ),
            const SizedBox(height: 8),
            FlightItemTile(label: 'Device', content: deviceName),
            FlightItemTile(label: 'Origin', content: originCoordinates),
            FlightItemTile(
                label: 'Radius', content: '${flight.location.radius}m'),
            FlightItemTile(label: 'Altitude', content: altitude),
          ],
        ),
      ),
    );
  }
}
