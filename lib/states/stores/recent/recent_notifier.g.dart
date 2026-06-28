// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentNotifier)
final recentProvider = RecentNotifierProvider._();

final class RecentNotifierProvider
    extends $NotifierProvider<RecentNotifier, List<MediaDetailModel>> {
  RecentNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentNotifierHash();

  @$internal
  @override
  RecentNotifier create() => RecentNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MediaDetailModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MediaDetailModel>>(value),
    );
  }
}

String _$recentNotifierHash() => r'f96c0b9fee83e06941df3c72596f243ce188f8ee';

abstract class _$RecentNotifier extends $Notifier<List<MediaDetailModel>> {
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
