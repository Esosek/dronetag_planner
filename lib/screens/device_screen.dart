import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/components/screen_wrapper.dart';
import 'package:dronetag_planner/providers/devices_provider.dart';
import 'package:dronetag_planner/models/device.dart';
import 'package:dronetag_planner/components/device/device_item.dart';
import 'package:dronetag_planner/components/device/new_device_form.dart';

class DeviceScreen extends ConsumerWidget {
  const DeviceScreen({super.key});

  void _openAddDeviceModal(BuildContext context, bool isLandscape) async {
    await showModalBottomSheet(
      isScrollControlled: isLandscape ? true : false,
      context: context,
      builder: (context) => Container(
        height: isLandscape ? MediaQuery.of(context).size.height * 0.8 : null,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment:
              isLandscape ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            NewDeviceForm(
              showLabel: true,
              onDeviceCreated: () => Navigator.of(context).pop(),
            ),
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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final devices = ref.watch(devicesProvider);

    // Return user to login screen if he deletes all devices
    // Just a fallback now, should not happen
    if (devices.isEmpty) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    return ScreenWrapper(
      screenTitle: 'Choose device',
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openAddDeviceModal(context, isLandscape),
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
