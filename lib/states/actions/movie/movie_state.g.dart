// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMovieNowPlaying)
final getMovieNowPlayingProvider = GetMovieNowPlayingProvider._();

final class GetMovieNowPlayingProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MediaModel>>,
          List<MediaModel>,
          FutureOr<List<MediaModel>>
        >
    with $FutureModifier<List<MediaModel>>, $FutureProvider<List<MediaModel>> {
  GetMovieNowPlayingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieNowPlayingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieNowPlayingHash();

  @$internal
  @override
  $FutureProviderElement<List<MediaModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MediaModel>> create(Ref ref) {
    return getMovieNowPlaying(ref);
  }
}

String _$getMovieNowPlayingHash() =>
    r'b25d4497e38c192b7c744f2201009db7683039ad';

@ProviderFor(getMovieDetail)
final getMovieDetailProvider = GetMovieDetailFamily._();

final class GetMovieDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<MediaDetailModel?>,
          MediaDetailModel?,
          FutureOr<MediaDetailModel?>
        >
    with
        $FutureModifier<MediaDetailModel?>,
        $FutureProvider<MediaDetailModel?> {
  GetMovieDetailProvider._({
    required GetMovieDetailFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'getMovieDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getMovieDetailHash();

  @override
  String toString() {
    return r'getMovieDetailProvider'
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
    return getMovieDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMovieDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getMovieDetailHash() => r'69118691a4903fea45a757bfd44557931aa7cb93';

final class GetMovieDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MediaDetailModel?>, int?> {
  GetMovieDetailFamily._()
    : super(
        retry: null,
        name: r'getMovieDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetMovieDetailProvider call(int? movieId) =>
      GetMovieDetailProvider._(argument: movieId, from: this);

  @override
  String toString() => r'getMovieDetailProvider';
}

@ProviderFor(getMovieReviews)
final getMovieReviewsProvider = GetMovieReviewsFamily._();

final class GetMovieReviewsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReviewModel>>,
          List<ReviewModel>,
          FutureOr<List<ReviewModel>>
        >
    with
        $FutureModifier<List<ReviewModel>>,
        $FutureProvider<List<ReviewModel>> {
  GetMovieReviewsProvider._({
    required GetMovieReviewsFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'getMovieReviewsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getMovieReviewsHash();

  @override
  String toString() {
    return r'getMovieReviewsProvider'
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
    return getMovieReviews(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMovieReviewsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getMovieReviewsHash() => r'97da54feafd117deec374a5a5686d8c38fb568da';

final class GetMovieReviewsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ReviewModel>>, int?> {
  GetMovieReviewsFamily._()
    : super(
        retry: null,
        name: r'getMovieReviewsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetMovieReviewsProvider call(int? movieId) =>
      GetMovieReviewsProvider._(argument: movieId, from: this);

  @override
  String toString() => r'getMovieReviewsProvider';
}
