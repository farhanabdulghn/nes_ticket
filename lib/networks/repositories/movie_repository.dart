import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/models/paginated/paginated_model.dart';
import 'package:nes_ticket/models/credit/credit_model.dart';
import 'package:nes_ticket/models/media/media_model.dart';
import 'package:nes_ticket/models/media_detail/media_detail_model.dart';
import 'package:nes_ticket/models/review/review_model.dart';
import 'package:nes_ticket/networks/api_server.dart';

class MovieRepository {
  final _apiServer = ApiServer.getInstance();
  final _endpoint = '/movie';

  Future<List<MediaModel>> getMovieNowPlaying() async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/now_playing',
    );

    return response.toModelList(MediaModel.fromJson);
  }

  Future<PaginatedModel<MediaModel>> getMovieTopRated({int page = 1}) async {
    final queryParams = <String, dynamic>{'page': page};

    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/top_rated',
      queryParams: queryParams,
    );

    return PaginatedModel<MediaModel>.fromJson(
      response.data,
      (json) => MediaModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<MediaDetailModel?> getMovieDetail(int? movieId) async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/$movieId',
    );

    return MediaDetailModel.fromJson(response.data);
  }

  Future<CreditModel?> getMovieCredits(int? movieId) async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/$movieId/credits',
    );

    return CreditModel.fromJson(response.data);
  }

  Future<List<ReviewModel>> getMovieReviews(int? movieId) async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/$movieId/reviews',
    );

    return response.toModelList(ReviewModel.fromJson);
  }
}
