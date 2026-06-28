import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_ticket/models/paginated/paginated_model.dart';

mixin PaginationNotifierMixin<T> {
  int page = 1;
  int _totalPages = 1;
  bool hasMore = true;
  bool isFetchingMore = false;

  Future<PaginatedModel<T>> fetch(int page);

  AsyncValue<List<T>> get state;
  set state(AsyncValue<List<T>> value);

  Future<List<T>> initialFetch() async {
    final response = await fetch(page);
    _totalPages = response.totalPages;

    hasMore = page < _totalPages && response.results.isNotEmpty;

    return response.results;
  }

  Future<void> fetchMore() async {
    if (!hasMore || isFetchingMore || state.isLoading || state.hasError) return;

    isFetchingMore = true;
    page++;

    try {
      final response = await fetch(page);
      _totalPages = response.totalPages;

      if (page >= _totalPages || response.results.isEmpty) hasMore = false;

      final currentData = state.value ?? [];
      state = AsyncData([...currentData, ...response.results]);
    } catch (e) {
      page--;
    } finally {
      isFetchingMore = false;
    }
  }
}
