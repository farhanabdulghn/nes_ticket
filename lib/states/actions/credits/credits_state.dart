import 'package:nes_ticket/models/credit/credit_model.dart';
import 'package:nes_ticket/models/member/member_model.dart';
import 'package:nes_ticket/networks/repositories/movie_repository.dart';
import 'package:nes_ticket/networks/repositories/tv_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credits_state.g.dart';

@riverpod
Future<CreditModel?> getCredits(
  Ref ref, {
  required int? id,
  required bool isTv,
}) {
  return isTv
      ? TvRepository().getTvCredits(id)
      : MovieRepository().getMovieCredits(id);
}

@riverpod
Future<List<MemberModel>?> getCreditsCast(
  Ref ref, {
  required int? id,
  required bool isTv,
}) async {
  final response = await ref.watch(
    getCreditsProvider(id: id, isTv: isTv).future,
  );

  return response?.cast;
}

@riverpod
Future<List<MemberModel>?> getCreditsCrew(
  Ref ref, {
  required int? id,
  required bool isTv,
}) async {
  final response = await ref.watch(
    getCreditsProvider(id: id, isTv: isTv).future,
  );

  return response?.crew;
}
