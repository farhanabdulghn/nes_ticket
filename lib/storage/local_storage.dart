import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:nes_ticket/models/media_detail/media_detail_model.dart';
import 'package:nes_ticket/models/user/user_model.dart';
import 'package:nes_ticket/utils/enums/enums.dart';

class LocalStorage {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(MediaDetailModelAdapter());
    Hive.registerAdapter(BelongsToCollectionAdapter());
    Hive.registerAdapter(GenreAdapter());
    Hive.registerAdapter(ProductionCompanyAdapter());
    Hive.registerAdapter(ProductionCountryAdapter());
    Hive.registerAdapter(SpokenLanguageAdapter());
    Hive.registerAdapter(MediaTypeAdapter());

    await Hive.openBox<UserModel>(HiveBox.auth.name);
    await Hive.openBox<MediaDetailModel>(HiveBox.recent.name);
    await Hive.openBox<MediaDetailModel>(HiveBox.watchlist.name);
  }
}
