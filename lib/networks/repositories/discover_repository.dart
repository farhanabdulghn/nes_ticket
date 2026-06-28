import 'package:nes_ticket/models/media/media_model.dart';
import 'package:nes_ticket/models/paginated/paginated_model.dart';
import 'package:nes_ticket/networks/api_server.dart';

class DiscoverRepository {
  final _apiServer = ApiServer.getInstance();
  final _endPoint = '/discover';

  Future<PaginatedModel<MediaModel>> getMovieByGenre({
    required int? genreId,
    int page = 1,
  }) async {
    final queryParams = <String, dynamic>{'with_genres': genreId, 'page': page};

    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endPoint/movie',
      queryParams: queryParams,
    );

    return PaginatedModel<MediaModel>.fromJson(
      response.data,
      (json) => MediaModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<PaginatedModel<MediaModel>> getTvByGenre({
    required int? genreId,
    int page = 1,
  }) async {
    final queryParams = <String, dynamic>{'with_genres': genreId, 'page': page};

    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endPoint/tv',
      queryParams: queryParams,
    );

    return PaginatedModel<MediaModel>.fromJson(
      response.data,
      (json) => MediaModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
