import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/components/screen_wrapper.dart';
import 'package:dronetag_planner/providers/flights_provider.dart';
import 'package:dronetag_planner/components/flight/flight_item.dart';
import 'package:dronetag_planner/screens/planner_screen.dart';

class FlightScreen extends ConsumerWidget {
  const FlightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flights = ref.watch(flightsProvider);

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
      body: ListView.builder(
        itemCount: flights.length,
        itemBuilder: (context, index) => FlightItem(flights[index]),
      ),
    );
  }
}
