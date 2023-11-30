class Device {
  const Device({
    required this.uasId,
    this.label,
    this.isActive = false,
  });

  Device setActive(bool value) {
    return Device(
      uasId: uasId,
      label: label,
      isActive: value,
    );
  }

  final String uasId;
  final String? label;
  final bool isActive;
}
