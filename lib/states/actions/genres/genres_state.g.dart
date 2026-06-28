// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMovieGenres)
final getMovieGenresProvider = GetMovieGenresProvider._();

final class GetMovieGenresProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<KeyLabelModel>>,
          List<KeyLabelModel>,
          FutureOr<List<KeyLabelModel>>
        >
    with
        $FutureModifier<List<KeyLabelModel>>,
        $FutureProvider<List<KeyLabelModel>> {
  GetMovieGenresProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieGenresProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieGenresHash();

  @$internal
  @override
  $FutureProviderElement<List<KeyLabelModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<KeyLabelModel>> create(Ref ref) {
    return getMovieGenres(ref);
  }
}

String _$getMovieGenresHash() => r'3a7423bab6c4b221fb1f9de39f24c2d02952f47d';

@ProviderFor(getTvGenres)
final getTvGenresProvider = GetTvGenresProvider._();

final class GetTvGenresProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<KeyLabelModel>>,
          List<KeyLabelModel>,
          FutureOr<List<KeyLabelModel>>
        >
    with
        $FutureModifier<List<KeyLabelModel>>,
        $FutureProvider<List<KeyLabelModel>> {
  GetTvGenresProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTvGenresProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTvGenresHash();

  @$internal
  @override
  $FutureProviderElement<List<KeyLabelModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<KeyLabelModel>> create(Ref ref) {
    return getTvGenres(ref);
  }
}

String _$getTvGenresHash() => r'32db40d6c5e728e62e4a1195e370b43f34378fac';
