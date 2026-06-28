import 'package:nes_ticket/models/key_label/key_label_model.dart';
import 'package:nes_ticket/networks/repositories/genres_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'genres_state.g.dart';

final _repository = GenresRepository();

@riverpod
Future<List<KeyLabelModel>> getMovieGenres(Ref ref) {
  return _repository.getMovieGenres();
}

@riverpod
Future<List<KeyLabelModel>> getTvGenres(Ref ref) {
  return _repository.getTvGenres();
}
