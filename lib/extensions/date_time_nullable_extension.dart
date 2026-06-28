part of 'extensions.dart';

extension DateTimeNullableExtension on DateTime? {
  String get toFormattedDate {
    if (this == null) return '-';

    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final monthName = months[this!.month];

    final dayString = this!.day.toString().padLeft(2, '0');

    final yearString = this!.year.toString();

    return '$monthName $dayString, $yearString';
  }

  String get toIndoDate {
    if (this == null) return '';
    final d = this!;
    return '${d.day.toString().padLeft(2, '0')} '
        '${StringsConstants.arrayMonths[d.month - 1]} '
        '${d.year}';
  }

  String get toIndoDateMonth {
    if (this == null) return '';
    final d = this!;
    return '${StringsConstants.arrayMonths[d.month - 1]} '
        '${d.year}';
  }

  String get toSlashDate {
    if (this == null) return '-';

    final dayString = this!.day.toString().padLeft(2, '0');
    final monthString = this!.month.toString().padLeft(2, '0');
    final yearString = this!.year.toString();

    return '$dayString/$monthString/$yearString';
  }
}
