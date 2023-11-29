import 'package:dronetag_planner/components/device/active_device_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/providers/flights_provider.dart';
import 'package:dronetag_planner/components/flight/flight_item.dart';

class FlightScreen extends ConsumerWidget {
  const FlightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flights = ref.watch(flightsProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your planned flights'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          // TODO: Implement FAB onPressed in FlightScreen
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ActiveDeviceIndicator(),
              Expanded(
                child: ListView.builder(
                  itemCount: flights.length,
                  itemBuilder: (context, index) => FlightItem(flights[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
