// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DiscoverNotifier)
final discoverProvider = DiscoverNotifierFamily._();

final class DiscoverNotifierProvider
    extends $AsyncNotifierProvider<DiscoverNotifier, List<MediaModel>> {
  DiscoverNotifierProvider._({
    required DiscoverNotifierFamily super.from,
    required ({MediaType type, int? genreId}) super.argument,
  }) : super(
         retry: null,
         name: r'discoverProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$discoverNotifierHash();

  @override
  String toString() {
    return r'discoverProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DiscoverNotifier create() => DiscoverNotifier();

  @override
  bool operator ==(Object other) {
    return other is DiscoverNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$discoverNotifierHash() => r'95362582aa234510b7bc8725053e2c30d00f412f';

final class DiscoverNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DiscoverNotifier,
          AsyncValue<List<MediaModel>>,
          List<MediaModel>,
          FutureOr<List<MediaModel>>,
          ({MediaType type, int? genreId})
        > {
  DiscoverNotifierFamily._()
    : super(
        retry: null,
        name: r'discoverProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DiscoverNotifierProvider call({
    required MediaType type,
    required int? genreId,
  }) => DiscoverNotifierProvider._(
    argument: (type: type, genreId: genreId),
    from: this,
  );

  @override
  String toString() => r'discoverProvider';
}

abstract class _$DiscoverNotifier extends $AsyncNotifier<List<MediaModel>> {
  late final _$args = ref.$arg as ({MediaType type, int? genreId});
  MediaType get type => _$args.type;
  int? get genreId => _$args.genreId;

  FutureOr<List<MediaModel>> build({
    required MediaType type,
    required int? genreId,
  });
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<MediaModel>>, List<MediaModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MediaModel>>, List<MediaModel>>,
              AsyncValue<List<MediaModel>>,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(type: _$args.type, genreId: _$args.genreId),
    );
  }
}
