import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dronetag_planner/utility/custom_logger.dart';
import 'package:dronetag_planner/models/device.dart';

class DevicesProvider extends StateNotifier<List<Device>> {
  DevicesProvider() : super([]);

  final log = CustomLogger('DevicesProvider');

  bool addDevice(Device device) {
    state = [...state, device];
    setActiveDevice(device);
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
