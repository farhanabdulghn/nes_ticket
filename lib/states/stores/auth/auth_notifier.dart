import 'dart:math';

import 'package:hive_ce/hive.dart';
import 'package:nes_ticket/models/user/user_model.dart';
import 'package:nes_ticket/states/stores/recent/recent_notifier.dart';
import 'package:nes_ticket/states/stores/watchlist/watchlist_notifier.dart';
import 'package:nes_ticket/utils/enums/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

DateTime _generateRandomDatePast5Years() {
  final random = Random();
  final now = DateTime.now();

  final fiveYearsAgo = now.subtract(Duration(days: 365 * 5));
  final differenceInDays = now.difference(fiveYearsAgo).inDays;
  final randomDays = random.nextInt(differenceInDays);

  return fiveYearsAgo.add(Duration(days: randomDays));
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  Box<UserModel> get _box => Hive.box<UserModel>(HiveBox.auth.name);
  static const _key = 'current_user';

  @override
  UserModel? build() {
    return _box.get(_key);
  }

  void login(String email, String password) {
    final name = email.split('@').first;

    final createdAt = _generateRandomDatePast5Years();

    final user = UserModel(email: email, name: name, createdAt: createdAt);

    _box.put(_key, user);

    state = user;
  }

  Future<void> logout() async {
    await _box.clear();

    await ref.read(recentProvider.notifier).clear();
    await ref.read(watchlistProvider.notifier).clear();

    if (ref.mounted) state = null;
  }
}
