// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTvDetail)
final getTvDetailProvider = GetTvDetailFamily._();

final class GetTvDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<MediaDetailModel?>,
          MediaDetailModel?,
          FutureOr<MediaDetailModel?>
        >
    with
        $FutureModifier<MediaDetailModel?>,
        $FutureProvider<MediaDetailModel?> {
  GetTvDetailProvider._({
    required GetTvDetailFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'getTvDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTvDetailHash();

  @override
  String toString() {
    return r'getTvDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MediaDetailModel?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MediaDetailModel?> create(Ref ref) {
    final argument = this.argument as int?;
    return getTvDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTvDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTvDetailHash() => r'00bb3ed0e2e9d617d085addfba8cc693c9b95f82';

final class GetTvDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MediaDetailModel?>, int?> {
  GetTvDetailFamily._()
    : super(
        retry: null,
        name: r'getTvDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTvDetailProvider call(int? tvId) =>
      GetTvDetailProvider._(argument: tvId, from: this);

  @override
  String toString() => r'getTvDetailProvider';
}

@ProviderFor(getTvReviews)
final getTvReviewsProvider = GetTvReviewsFamily._();

final class GetTvReviewsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReviewModel>>,
          List<ReviewModel>,
          FutureOr<List<ReviewModel>>
        >
    with
        $FutureModifier<List<ReviewModel>>,
        $FutureProvider<List<ReviewModel>> {
  GetTvReviewsProvider._({
    required GetTvReviewsFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'getTvReviewsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTvReviewsHash();

  @override
  String toString() {
    return r'getTvReviewsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ReviewModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ReviewModel>> create(Ref ref) {
    final argument = this.argument as int?;
    return getTvReviews(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTvReviewsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTvReviewsHash() => r'b5a66ca72b01edab49a9fa832d1e05f014dd6328';

final class GetTvReviewsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ReviewModel>>, int?> {
  GetTvReviewsFamily._()
    : super(
        retry: null,
        name: r'getTvReviewsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTvReviewsProvider call(int? tvId) =>
      GetTvReviewsProvider._(argument: tvId, from: this);

  @override
  String toString() => r'getTvReviewsProvider';
}
