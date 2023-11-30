import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/components/screen_wrapper.dart';
import 'package:dronetag_planner/providers/devices_provider.dart';
import 'package:dronetag_planner/models/device.dart';
import 'package:dronetag_planner/components/device/device_item.dart';

class DeviceScreen extends ConsumerWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(devicesProvider);

    // Return user to login screen if he deletes all devices
    if (devices.isEmpty) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    return ScreenWrapper(
      screenTitle: 'Choose device',
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          for (Device device in devices) DeviceItem(device),
        ],
      ),
    );
  }
}
