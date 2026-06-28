import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/models/paginated/paginated_model.dart';
import 'package:nes_ticket/models/credit/credit_model.dart';
import 'package:nes_ticket/models/media/media_model.dart';
import 'package:nes_ticket/models/media_detail/media_detail_model.dart';
import 'package:nes_ticket/models/review/review_model.dart';
import 'package:nes_ticket/networks/api_server.dart';

class TvRepository {
  final _apiServer = ApiServer.getInstance();
  final _endpoint = '/tv';

  Future<PaginatedModel<MediaModel>> getTvTopRated({int page = 1}) async {
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

  Future<MediaDetailModel?> getTvDetail(int? tvId) async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/$tvId',
    );

    return MediaDetailModel.fromJson(response.data);
  }

  Future<CreditModel?> getTvCredits(int? tvId) async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/$tvId/credits',
    );

    return CreditModel.fromJson(response.data);
  }

  Future<List<ReviewModel>> getTvReviews(int? tvId) async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/$tvId/reviews',
    );

    return response.toModelList(ReviewModel.fromJson);
  }
}
