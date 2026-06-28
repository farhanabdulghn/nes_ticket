part of 'extensions.dart';

extension IntNullableExtension on int? {
  bool get hasValue => this != null && this != 0;
  bool get hasNoValue => !hasValue;

  String get toHoursAndMinutes {
    if (hasNoValue) return '0 menit';

    final int hours = this! ~/ 60;
    final int minutes = this! % 60;

    if (hours > 0 && minutes > 0) {
      return '$hours jam $minutes menit';
    } else if (hours > 0) {
      return '$hours jam';
    } else {
      return '$minutes menit';
    }
  }
}
