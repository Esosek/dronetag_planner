import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/models/device.dart';
import 'package:dronetag_planner/providers/devices_provider.dart';

class DeviceItem extends ConsumerWidget {
  const DeviceItem(
    this.device, {
    super.key,
  });

  final Device device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDevice = ref.watch(devicesProvider).firstWhere(
          (device) => device.isActive,
        );
    final devicesNotifier = ref.watch(devicesProvider.notifier);

    return ListTile(
      title: Row(
        children: [
          Radio(
            splashRadius: 50,
            value: device,
            groupValue: selectedDevice,
            onChanged: (value) {
              devicesNotifier.setActiveDevice(device);
            },
          ),
          Text(
            device.label != null
                ? '${device.label} (${device.uasId})'
                : device.uasId,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
      trailing: IconButton(
        // TODO: When deleting fails, show SnackBar
        onPressed: () => devicesNotifier.removeDevice(device),
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
