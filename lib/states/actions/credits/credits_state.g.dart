// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCredits)
final getCreditsProvider = GetCreditsFamily._();

final class GetCreditsProvider
    extends
        $FunctionalProvider<
          AsyncValue<CreditModel?>,
          CreditModel?,
          FutureOr<CreditModel?>
        >
    with $FutureModifier<CreditModel?>, $FutureProvider<CreditModel?> {
  GetCreditsProvider._({
    required GetCreditsFamily super.from,
    required ({int? id, bool isTv}) super.argument,
  }) : super(
         retry: null,
         name: r'getCreditsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getCreditsHash();

  @override
  String toString() {
    return r'getCreditsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CreditModel?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CreditModel?> create(Ref ref) {
    final argument = this.argument as ({int? id, bool isTv});
    return getCredits(ref, id: argument.id, isTv: argument.isTv);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCreditsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getCreditsHash() => r'91d488e67eb037eed241fb934cb2539d402116e8';

final class GetCreditsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CreditModel?>,
          ({int? id, bool isTv})
        > {
  GetCreditsFamily._()
    : super(
        retry: null,
        name: r'getCreditsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetCreditsProvider call({required int? id, required bool isTv}) =>
      GetCreditsProvider._(argument: (id: id, isTv: isTv), from: this);

  @override
  String toString() => r'getCreditsProvider';
}

@ProviderFor(getCreditsCast)
final getCreditsCastProvider = GetCreditsCastFamily._();

final class GetCreditsCastProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MemberModel>?>,
          List<MemberModel>?,
          FutureOr<List<MemberModel>?>
        >
    with
        $FutureModifier<List<MemberModel>?>,
        $FutureProvider<List<MemberModel>?> {
  GetCreditsCastProvider._({
    required GetCreditsCastFamily super.from,
    required ({int? id, bool isTv}) super.argument,
  }) : super(
         retry: null,
         name: r'getCreditsCastProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getCreditsCastHash();

  @override
  String toString() {
    return r'getCreditsCastProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<MemberModel>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MemberModel>?> create(Ref ref) {
    final argument = this.argument as ({int? id, bool isTv});
    return getCreditsCast(ref, id: argument.id, isTv: argument.isTv);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCreditsCastProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getCreditsCastHash() => r'ae717a59f10199e6a01999e66bf50b3859b48dd4';

final class GetCreditsCastFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<MemberModel>?>,
          ({int? id, bool isTv})
        > {
  GetCreditsCastFamily._()
    : super(
        retry: null,
        name: r'getCreditsCastProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetCreditsCastProvider call({required int? id, required bool isTv}) =>
      GetCreditsCastProvider._(argument: (id: id, isTv: isTv), from: this);

  @override
  String toString() => r'getCreditsCastProvider';
}

@ProviderFor(getCreditsCrew)
final getCreditsCrewProvider = GetCreditsCrewFamily._();

final class GetCreditsCrewProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MemberModel>?>,
          List<MemberModel>?,
          FutureOr<List<MemberModel>?>
        >
    with
        $FutureModifier<List<MemberModel>?>,
        $FutureProvider<List<MemberModel>?> {
  GetCreditsCrewProvider._({
    required GetCreditsCrewFamily super.from,
    required ({int? id, bool isTv}) super.argument,
  }) : super(
         retry: null,
         name: r'getCreditsCrewProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getCreditsCrewHash();

  @override
  String toString() {
    return r'getCreditsCrewProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<MemberModel>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MemberModel>?> create(Ref ref) {
    final argument = this.argument as ({int? id, bool isTv});
    return getCreditsCrew(ref, id: argument.id, isTv: argument.isTv);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCreditsCrewProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getCreditsCrewHash() => r'a74cfc0f130a7999c34990c4d92eb7d9a99dcc59';

final class GetCreditsCrewFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<MemberModel>?>,
          ({int? id, bool isTv})
        > {
  GetCreditsCrewFamily._()
    : super(
        retry: null,
        name: r'getCreditsCrewProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetCreditsCrewProvider call({required int? id, required bool isTv}) =>
      GetCreditsCrewProvider._(argument: (id: id, isTv: isTv), from: this);

  @override
  String toString() => r'getCreditsCrewProvider';
}
