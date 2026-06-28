import 'package:hive_ce/hive.dart';
import 'package:nes_ticket/models/media_detail/media_detail_model.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_notifier.g.dart';

@riverpod
class RecentNotifier extends _$RecentNotifier {
  Box<MediaDetailModel> get _box =>
      Hive.box<MediaDetailModel>(HiveBox.recent.name);
  final int _maxItems = 20;

  @override
  List<MediaDetailModel> build() {
    return _box.values.toList().reversed.toList();
  }

  void addRecent(MediaDetailModel movie) {
    if (movie.id == null) return;

    final existingKey = _box.keys.firstWhere(
      (k) => _box.get(k)?.id == movie.id,
      orElse: () => null,
    );

    if (existingKey != null) _box.delete(existingKey);

    final timestampKey = DateTime.now().millisecondsSinceEpoch.toString();

    _box.put(timestampKey, movie);

    if (_box.length > _maxItems) {
      final oldestKey = _box.keys.first;

      _box.delete(oldestKey);
    }

    state = _box.values.toList().reversed.toList();
  }

  Future<void> clear() async {
    await _box.clear();
    if (ref.mounted) state = [];
  }
}
