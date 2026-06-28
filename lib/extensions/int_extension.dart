part of 'extensions.dart';

extension IntExtension on int {
  String toMonthName() {
    const months = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[clamp(1, 12).toInt()];
  }
}
