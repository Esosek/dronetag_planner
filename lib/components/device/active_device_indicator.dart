import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/providers/devices_provider.dart';
import 'package:dronetag_planner/components/ui/custom_elevated_button.dart';

class ActiveDeviceIndicator extends ConsumerWidget {
  const ActiveDeviceIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(devicesProvider);
    final activeDevice = devices.firstWhere((device) => device.isActive);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomElevatedButton(
            label: activeDevice.label ?? activeDevice.uasId,
            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            fixWidth: 160,
            onPressed: () {}),
        Text(
          'Tap to switch',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(letterSpacing: 1),
        ),
      ],
    );
  }
}
