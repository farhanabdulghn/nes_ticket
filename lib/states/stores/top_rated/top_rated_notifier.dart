import 'package:nes_ticket/mixins/pagination_notifier_mixin.dart';
import 'package:nes_ticket/models/paginated/paginated_model.dart';
import 'package:nes_ticket/models/media/media_model.dart';
import 'package:nes_ticket/networks/repositories/movie_repository.dart';
import 'package:nes_ticket/networks/repositories/tv_repository.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_rated_notifier.g.dart';

@riverpod
class TopRatedNotifier extends _$TopRatedNotifier
    with PaginationNotifierMixin<MediaModel> {
  @override
  FutureOr<List<MediaModel>> build(MediaType type) {
    page = 1;
    hasMore = true;
    isFetchingMore = false;

    return initialFetch();
  }

  @override
  Future<PaginatedModel<MediaModel>> fetch(int page) {
    switch (type) {
      case MediaType.movie:
        return MovieRepository().getMovieTopRated(page: page);
      case MediaType.tv:
        return TvRepository().getTvTopRated(page: page);
    }
  }
}
