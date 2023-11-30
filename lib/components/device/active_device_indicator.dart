import 'package:flutter/material.dart';

class ActiveDeviceIndicator extends StatelessWidget {
  const ActiveDeviceIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          child: SizedBox(
            width: 70,
            child: Text(
              'Millennium Falcon',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(),
            ),
          ),
        ),
        Text(
          'Change device',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
