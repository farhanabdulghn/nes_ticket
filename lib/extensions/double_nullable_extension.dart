part of 'extensions.dart';

extension DoubleNullableExtension on double? {
  int? toScorePercent(int? voteCount) {
    if (this == null || voteCount == null || voteCount == 0) {
      return null;
    }
    return (this!.clamp(0, 10) * 10).toInt();
  }
}
