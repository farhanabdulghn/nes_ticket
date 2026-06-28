// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTrendingDay)
final getTrendingDayProvider = GetTrendingDayFamily._();

final class GetTrendingDayProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MediaModel>>,
          List<MediaModel>,
          FutureOr<List<MediaModel>>
        >
    with $FutureModifier<List<MediaModel>>, $FutureProvider<List<MediaModel>> {
  GetTrendingDayProvider._({
    required GetTrendingDayFamily super.from,
    required ContentType super.argument,
  }) : super(
         retry: null,
         name: r'getTrendingDayProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTrendingDayHash();

  @override
  String toString() {
    return r'getTrendingDayProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<MediaModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MediaModel>> create(Ref ref) {
    final argument = this.argument as ContentType;
    return getTrendingDay(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTrendingDayProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTrendingDayHash() => r'c84f68eab0ca4e3f12d50bc7421caaf8f1b347a3';

final class GetTrendingDayFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<MediaModel>>, ContentType> {
  GetTrendingDayFamily._()
    : super(
        retry: null,
        name: r'getTrendingDayProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTrendingDayProvider call(ContentType category) =>
      GetTrendingDayProvider._(argument: category, from: this);

  @override
  String toString() => r'getTrendingDayProvider';
}
