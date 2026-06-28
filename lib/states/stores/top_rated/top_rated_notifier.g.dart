// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TopRatedNotifier)
final topRatedProvider = TopRatedNotifierFamily._();

final class TopRatedNotifierProvider
    extends $AsyncNotifierProvider<TopRatedNotifier, List<MediaModel>> {
  TopRatedNotifierProvider._({
    required TopRatedNotifierFamily super.from,
    required MediaType super.argument,
  }) : super(
         retry: null,
         name: r'topRatedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$topRatedNotifierHash();

  @override
  String toString() {
    return r'topRatedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TopRatedNotifier create() => TopRatedNotifier();

  @override
  bool operator ==(Object other) {
    return other is TopRatedNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$topRatedNotifierHash() => r'aeb485064b75a031e892bf8375b48bf510569a49';

final class TopRatedNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TopRatedNotifier,
          AsyncValue<List<MediaModel>>,
          List<MediaModel>,
          FutureOr<List<MediaModel>>,
          MediaType
        > {
  TopRatedNotifierFamily._()
    : super(
        retry: null,
        name: r'topRatedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TopRatedNotifierProvider call(MediaType type) =>
      TopRatedNotifierProvider._(argument: type, from: this);

  @override
  String toString() => r'topRatedProvider';
}

abstract class _$TopRatedNotifier extends $AsyncNotifier<List<MediaModel>> {
  late final _$args = ref.$arg as MediaType;
  MediaType get type => _$args;

  FutureOr<List<MediaModel>> build(MediaType type);
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
    return element.handleCreate(ref, () => build(_$args));
  }
}
