import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/device/active_device_indicator.dart';
import 'package:dronetag_planner/components/screen_wrapper.dart';
import 'package:dronetag_planner/components/flight/flight_form.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ScreenWrapper(
      screenTitle: 'Plan your flight',
      bodyPadding: EdgeInsets.fromLTRB(12, 12, 12, isLandscape ? 12 : 40),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ActiveDeviceIndicator(),
              if (!isLandscape) const SizedBox(height: 40),
              const FlightForm(),
            ],
          ),
        ),
      ),
    );
  }
}
