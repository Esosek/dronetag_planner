import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/models/device.dart';

const _dummyDevices = [
  Device(uasId: '0000512345', label: 'Millennium Falcon', isActive: false),
  Device(uasId: '00003123', label: 'Nebuchadnezzar', isActive: true),
  Device(uasId: '0000A1234567891', isActive: false),
];

class DevicesProvider extends StateNotifier<List<Device>> {
  DevicesProvider() : super(_dummyDevices);

  // TODO: Add device

  // TODO: Remove device

  // TODO: Switch device
}

final devicesProvider = StateNotifierProvider<DevicesProvider, List<Device>>(
    (ref) => DevicesProvider());
