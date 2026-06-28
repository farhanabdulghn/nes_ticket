import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/models/key_label/key_label_model.dart';
import 'package:nes_ticket/networks/api_server.dart';

class GenresRepository {
  final _apiServer = ApiServer.getInstance();
  final _endpoint = '/genre';

  Future<List<KeyLabelModel>> getMovieGenres() async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/movie/list',
    );

    return response.toModelList(KeyLabelModel.fromJson, key: 'genres');
  }

  Future<List<KeyLabelModel>> getTvGenres() async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '$_endpoint/tv/list',
    );

    return response.toModelList(KeyLabelModel.fromJson, key: 'genres');
  }
}
