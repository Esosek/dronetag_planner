import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/device/active_device_indicator.dart';
import 'package:dronetag_planner/components/screen_wrapper.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      screenTitle: 'Plan your flight',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ActiveDeviceIndicator(),
        ],
      ),
    );
  }
}
