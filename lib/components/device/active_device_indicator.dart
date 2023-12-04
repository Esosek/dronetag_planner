import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/providers/devices_provider.dart';
import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';
import 'package:dronetag_planner/screens/device_screen.dart';

class ActiveDeviceIndicator extends ConsumerWidget {
  const ActiveDeviceIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(devicesProvider);
    final activeDevice = devices.firstWhere((device) => device.isActive);
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomElevatedButton(
            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            fixWidth: 160,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DeviceScreen(),
              ),
            ),
            child: Text(activeDevice.label ?? activeDevice.uasId),
          ),
          Text(
            'Tap to switch',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
