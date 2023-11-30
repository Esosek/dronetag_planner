import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/components/screen_wrapper.dart';
import 'package:dronetag_planner/providers/devices_provider.dart';
import 'package:dronetag_planner/models/device.dart';
import 'package:dronetag_planner/components/device/device_item.dart';
import 'package:dronetag_planner/components/device/new_device_form.dart';

class DeviceScreen extends ConsumerWidget {
  const DeviceScreen({super.key});

  void _openAddDeviceModal(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const NewDeviceForm(showLabel: true),
            const SizedBox(height: 4),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

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
        onPressed: () => _openAddDeviceModal(context),
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
