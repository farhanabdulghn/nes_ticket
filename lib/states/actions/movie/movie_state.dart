import 'package:nes_ticket/models/media/media_model.dart';
import 'package:nes_ticket/models/media_detail/media_detail_model.dart';
import 'package:nes_ticket/models/review/review_model.dart';
import 'package:nes_ticket/networks/repositories/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_state.g.dart';

final _repository = MovieRepository();

@riverpod
Future<List<MediaModel>> getMovieNowPlaying(Ref ref) {
  return _repository.getMovieNowPlaying();
}

@riverpod
Future<MediaDetailModel?> getMovieDetail(Ref ref, int? movieId) {
  return _repository.getMovieDetail(movieId);
}

@riverpod
Future<List<ReviewModel>> getMovieReviews(Ref ref, int? movieId) {
  return _repository.getMovieReviews(movieId);
}
