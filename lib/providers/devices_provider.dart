import 'package:dronetag_planner/utility/custom_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/models/device.dart';

const _dummyDevices = [
  Device(uasId: '0000512345', label: 'Millennium Falcon', isActive: false),
  Device(uasId: '00003123', label: 'Nebuchadnezzar', isActive: true),
  Device(uasId: '0000A1234567891', isActive: false),
];

class DevicesProvider extends StateNotifier<List<Device>> {
  DevicesProvider() : super(_dummyDevices);

  final log = CustomLogger('DevicesProvider');

  bool addDevice(Device device) {
    // TODO: Validate device
    // if (!isUasValid(device.uasId)) {
    //   return false;
    // }
    state = [...state, device];
    log.trace(
        'Added new device with UAS ID "${device.uasId}" and label "${device.label}"');
    return true;
  }

  bool removeDevice(Device device) {
    if (device.isActive) {
      log.trace(
          'Device is active, removing failed UAS ID "${device.uasId}" and label "${device.label}"');
      return false;
    }
    state = state
        .where((stateDevice) => stateDevice.uasId != device.uasId)
        .toList();
    log.trace(
        'Removed device with UAS ID "${device.uasId}" and label "${device.label}"');
    return true;
  }

  void setActiveDevice(Device device) {
    final newState = state.map((stateDevice) {
      if (stateDevice == device) {
        log.trace(
            'Active device set to UAS ID "${device.uasId}" and label "${device.label}"');
        return stateDevice.setActive(true);
      }
      return stateDevice.setActive(false);
    }).toList();

    state = newState;
  }
}

final devicesProvider = StateNotifierProvider<DevicesProvider, List<Device>>(
    (ref) => DevicesProvider());
