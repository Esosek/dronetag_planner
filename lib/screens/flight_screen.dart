import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/components/screen_wrapper.dart';
import 'package:dronetag_planner/providers/flights_provider.dart';
import 'package:dronetag_planner/components/flight/flight_item.dart';
import 'package:dronetag_planner/screens/planner_screen.dart';
import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';

class FlightScreen extends ConsumerWidget {
  const FlightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flights = ref.watch(flightsProvider);
    final scheduledFlights = flights.where((flight) {
      if (flight.dateEnd.isBefore(DateTime.now())) {
        return false;
      }
      return true;
    }).toList();

    final emptyFlightsContent = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('You have no flights planned...'),
          const SizedBox(height: 16),
          CustomElevatedButton(
            child: const Text('Create new flight'),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PlannerScreen(),
              ),
            ),
          ),
        ],
      ),
    );

    return ScreenWrapper(
      screenTitle: 'Your planned flights',
      bodyPadding: const EdgeInsets.fromLTRB(12, 12, 12, 40),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PlannerScreen(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: flights.isEmpty
          ? emptyFlightsContent
          : ListView.builder(
              itemCount: scheduledFlights.length,
              itemBuilder: (context, index) =>
                  FlightItem(scheduledFlights[index]),
            ),
    );
  }
}
