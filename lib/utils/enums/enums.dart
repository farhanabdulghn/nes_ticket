import 'package:hive_ce/hive_ce.dart';

part 'enums.g.dart';

@HiveType(typeId: 7)
enum MediaType {
  @HiveField(0)
  movie,
  @HiveField(1)
  tv,
}

enum ContentType { all, movie, tv }

enum HiveBox { auth, recent, watchlist }
