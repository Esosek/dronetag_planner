import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/models/device.dart';

final _dummyDevices = [
  const Device(
      uasId: '0000512345', label: 'Millennium Falcon', isActive: false),
  const Device(uasId: '00003123', label: 'Nebuchadnezzar', isActive: true),
  const Device(uasId: '0000A1234567891', label: 'Serenity', isActive: false),
];

class DevicesProvider extends StateNotifier<List<Device>> {
  DevicesProvider() : super(_dummyDevices);
}

final devicesProvider = StateNotifierProvider<DevicesProvider, List<Device>>(
    (ref) => DevicesProvider());
