import 'package:flutter/material.dart';

import 'package:dronetag_planner/components/device/new_device_form.dart';
import 'package:dronetag_planner/components/screen_wrapper.dart';
import 'package:dronetag_planner/screens/flight_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ScreenWrapper(
      bodyPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Drone planner',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'Please register your device to proceed',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (!isLandscape) const SizedBox(height: 40),
          NewDeviceForm(
            onDeviceCreated: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FlightScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
