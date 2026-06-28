import 'package:nes_ticket/models/media/media_model.dart';
import 'package:nes_ticket/networks/repositories/trending_repository.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trending_state.g.dart';

@riverpod
Future<List<MediaModel>> getTrendingDay(Ref ref, ContentType category) {
  return TrendingRepository().getTrendingDay(category);
}
