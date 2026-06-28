import 'package:nes_ticket/extensions/extensions.dart';
import 'package:nes_ticket/models/media/media_model.dart';
import 'package:nes_ticket/networks/api_server.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

class TrendingRepository {
  Future<List<MediaModel>> getTrendingDay(ContentType category) async {
    final path = category.name;

    final response = await ApiServer.getInstance().callService(
      requestType: RequestType.get,
      endPoint: '/trending/$path/day',
    );

    return response.toModelList(MediaModel.fromJson);
  }
}
