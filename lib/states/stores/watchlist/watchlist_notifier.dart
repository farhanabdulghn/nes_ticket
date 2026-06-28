import 'package:hive_ce/hive.dart';
import 'package:nes_ticket/models/media_detail/media_detail_model.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'watchlist_notifier.g.dart';

@riverpod
class WatchlistNotifier extends _$WatchlistNotifier {
  Box<MediaDetailModel> get _box =>
      Hive.box<MediaDetailModel>(HiveBox.watchlist.name);

  @override
  List<MediaDetailModel> build() {
    return _box.values.toList().reversed.toList();
  }

  void toggleWatchlist(MediaDetailModel movie) {
    if (movie.id == null) return;

    if (_box.containsKey(movie.id)) {
      _box.delete(movie.id);
    } else {
      _box.put(movie.id, movie);
    }

    state = _box.values.toList().reversed.toList();
  }

  Future<void> clear() async {
    await _box.clear();
    if (ref.mounted) state = [];
  }
}
