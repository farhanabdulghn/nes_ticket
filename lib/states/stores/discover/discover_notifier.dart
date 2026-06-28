import 'package:nes_ticket/mixins/pagination_notifier_mixin.dart';
import 'package:nes_ticket/models/paginated/paginated_model.dart';
import 'package:nes_ticket/models/media/media_model.dart';
import 'package:nes_ticket/networks/repositories/discover_repository.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discover_notifier.g.dart';

final _repository = DiscoverRepository();

@riverpod
class DiscoverNotifier extends _$DiscoverNotifier
    with PaginationNotifierMixin<MediaModel> {
  @override
  FutureOr<List<MediaModel>> build({
    required MediaType type,
    required int? genreId,
  }) {
    page = 1;
    hasMore = true;
    isFetchingMore = false;

    return initialFetch();
  }

  @override
  Future<PaginatedModel<MediaModel>> fetch(int page) {
    switch (type) {
      case MediaType.movie:
        return _repository.getMovieByGenre(genreId: genreId, page: page);
      case MediaType.tv:
        return _repository.getTvByGenre(genreId: genreId, page: page);
    }
  }
}
