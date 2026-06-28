// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WatchlistNotifier)
final watchlistProvider = WatchlistNotifierProvider._();

final class WatchlistNotifierProvider
    extends $NotifierProvider<WatchlistNotifier, List<MediaDetailModel>> {
  WatchlistNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchlistProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchlistNotifierHash();

  @$internal
  @override
  WatchlistNotifier create() => WatchlistNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MediaDetailModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MediaDetailModel>>(value),
    );
  }
}

String _$watchlistNotifierHash() => r'8cdab2514dc5b1d9320f81c0d8a8cc901d871d41';

abstract class _$WatchlistNotifier extends $Notifier<List<MediaDetailModel>> {
  List<MediaDetailModel> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<List<MediaDetailModel>, List<MediaDetailModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<MediaDetailModel>, List<MediaDetailModel>>,
              List<MediaDetailModel>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
