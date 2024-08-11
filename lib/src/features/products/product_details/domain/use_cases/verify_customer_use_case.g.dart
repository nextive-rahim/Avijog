// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_customer_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyCustomerUseCaseHash() =>
    r'c5f9d87b1bed9c202d0cefd715d74effc883512b';

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

/// See also [verifyCustomerUseCase].
@ProviderFor(verifyCustomerUseCase)
const verifyCustomerUseCaseProvider = VerifyCustomerUseCaseFamily();

/// See also [verifyCustomerUseCase].
class VerifyCustomerUseCaseFamily extends Family<VerifyCustomerUseCase> {
  /// See also [verifyCustomerUseCase].
  const VerifyCustomerUseCaseFamily();

  /// See also [verifyCustomerUseCase].
  VerifyCustomerUseCaseProvider call({
    required Map<String, dynamic> body,
  }) {
    return VerifyCustomerUseCaseProvider(
      body: body,
    );
  }

  @override
  VerifyCustomerUseCaseProvider getProviderOverride(
    covariant VerifyCustomerUseCaseProvider provider,
  ) {
    return call(
      body: provider.body,
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
  String? get name => r'verifyCustomerUseCaseProvider';
}

/// See also [verifyCustomerUseCase].
class VerifyCustomerUseCaseProvider
    extends AutoDisposeProvider<VerifyCustomerUseCase> {
  /// See also [verifyCustomerUseCase].
  VerifyCustomerUseCaseProvider({
    required Map<String, dynamic> body,
  }) : this._internal(
          (ref) => verifyCustomerUseCase(
            ref as VerifyCustomerUseCaseRef,
            body: body,
          ),
          from: verifyCustomerUseCaseProvider,
          name: r'verifyCustomerUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyCustomerUseCaseHash,
          dependencies: VerifyCustomerUseCaseFamily._dependencies,
          allTransitiveDependencies:
              VerifyCustomerUseCaseFamily._allTransitiveDependencies,
          body: body,
        );

  VerifyCustomerUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
  }) : super.internal();

  final Map<String, dynamic> body;

  @override
  Override overrideWith(
    VerifyCustomerUseCase Function(VerifyCustomerUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyCustomerUseCaseProvider._internal(
        (ref) => create(ref as VerifyCustomerUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<VerifyCustomerUseCase> createElement() {
    return _VerifyCustomerUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyCustomerUseCaseProvider && other.body == body;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyCustomerUseCaseRef
    on AutoDisposeProviderRef<VerifyCustomerUseCase> {
  /// The parameter `body` of this provider.
  Map<String, dynamic> get body;
}

class _VerifyCustomerUseCaseProviderElement
    extends AutoDisposeProviderElement<VerifyCustomerUseCase>
    with VerifyCustomerUseCaseRef {
  _VerifyCustomerUseCaseProviderElement(super.provider);

  @override
  Map<String, dynamic> get body =>
      (origin as VerifyCustomerUseCaseProvider).body;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
