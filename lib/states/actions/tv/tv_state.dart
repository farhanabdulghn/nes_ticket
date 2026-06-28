import 'package:nes_ticket/models/media_detail/media_detail_model.dart';
import 'package:nes_ticket/models/review/review_model.dart';
import 'package:nes_ticket/networks/repositories/tv_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_state.g.dart';

final _repository = TvRepository();

@riverpod
Future<MediaDetailModel?> getTvDetail(Ref ref, int? tvId) {
  return _repository.getTvDetail(tvId);
}

@riverpod
Future<List<ReviewModel>> getTvReviews(Ref ref, int? tvId) {
  return _repository.getTvReviews(tvId);
}
