// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_payment_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initiatePaymentUseCaseHash() =>
    r'ef3fd74d3a508d86789a12badd1a5d5afcc6d872';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [initiatePaymentUseCase].
@ProviderFor(initiatePaymentUseCase)
const initiatePaymentUseCaseProvider = InitiatePaymentUseCaseFamily();

/// See also [initiatePaymentUseCase].
class InitiatePaymentUseCaseFamily extends Family<InitiatePaymentUseCase> {
  /// See also [initiatePaymentUseCase].
  const InitiatePaymentUseCaseFamily();

  /// See also [initiatePaymentUseCase].
  InitiatePaymentUseCaseProvider call({
    required Map<String, dynamic> body,
    required PaymentMethod paymentMethod,
  }) {
    return InitiatePaymentUseCaseProvider(
      body: body,
      paymentMethod: paymentMethod,
    );
  }

  @override
  InitiatePaymentUseCaseProvider getProviderOverride(
    covariant InitiatePaymentUseCaseProvider provider,
  ) {
    return call(
      body: provider.body,
      paymentMethod: provider.paymentMethod,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'initiatePaymentUseCaseProvider';
}

/// See also [initiatePaymentUseCase].
class InitiatePaymentUseCaseProvider
    extends AutoDisposeProvider<InitiatePaymentUseCase> {
  /// See also [initiatePaymentUseCase].
  InitiatePaymentUseCaseProvider({
    required Map<String, dynamic> body,
    required PaymentMethod paymentMethod,
  }) : this._internal(
          (ref) => initiatePaymentUseCase(
            ref as InitiatePaymentUseCaseRef,
            body: body,
            paymentMethod: paymentMethod,
          ),
          from: initiatePaymentUseCaseProvider,
          name: r'initiatePaymentUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$initiatePaymentUseCaseHash,
          dependencies: InitiatePaymentUseCaseFamily._dependencies,
          allTransitiveDependencies:
              InitiatePaymentUseCaseFamily._allTransitiveDependencies,
          body: body,
          paymentMethod: paymentMethod,
        );

  InitiatePaymentUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
    required this.paymentMethod,
  }) : super.internal();

  final Map<String, dynamic> body;
  final PaymentMethod paymentMethod;

  @override
  Override overrideWith(
    InitiatePaymentUseCase Function(InitiatePaymentUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InitiatePaymentUseCaseProvider._internal(
        (ref) => create(ref as InitiatePaymentUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
        paymentMethod: paymentMethod,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<InitiatePaymentUseCase> createElement() {
    return _InitiatePaymentUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InitiatePaymentUseCaseProvider &&
        other.body == body &&
        other.paymentMethod == paymentMethod;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);
    hash = _SystemHash.combine(hash, paymentMethod.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InitiatePaymentUseCaseRef
    on AutoDisposeProviderRef<InitiatePaymentUseCase> {
  /// The parameter `body` of this provider.
  Map<String, dynamic> get body;

  /// The parameter `paymentMethod` of this provider.
  PaymentMethod get paymentMethod;
}

class _InitiatePaymentUseCaseProviderElement
    extends AutoDisposeProviderElement<InitiatePaymentUseCase>
    with InitiatePaymentUseCaseRef {
  _InitiatePaymentUseCaseProviderElement(super.provider);

  @override
  Map<String, dynamic> get body =>
      (origin as InitiatePaymentUseCaseProvider).body;
  @override
  PaymentMethod get paymentMethod =>
      (origin as InitiatePaymentUseCaseProvider).paymentMethod;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
