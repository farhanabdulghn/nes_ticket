part of 'extensions.dart';

extension ApiExtension on Response {
  List<T> toModelList<T>(JsonMapper<T> fromJson, {String key = 'results'}) {
    return (data[key] as List?)
            ?.map((item) => fromJson(Map<String, dynamic>.from(item)))
            .toList() ??
        [];
  }
}
