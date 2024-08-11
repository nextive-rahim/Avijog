// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsUseCaseHash() =>
    r'c9b6ab90d7e8f0e480c7b09315e3e9932dc86030';

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

/// See also [getProductsUseCase].
@ProviderFor(getProductsUseCase)
const getProductsUseCaseProvider = GetProductsUseCaseFamily();

/// See also [getProductsUseCase].
class GetProductsUseCaseFamily extends Family<GetProductsUseCase> {
  /// See also [getProductsUseCase].
  const GetProductsUseCaseFamily();

  /// See also [getProductsUseCase].
  GetProductsUseCaseProvider call({
    String? vendorId,
  }) {
    return GetProductsUseCaseProvider(
      vendorId: vendorId,
    );
  }

  @override
  GetProductsUseCaseProvider getProviderOverride(
    covariant GetProductsUseCaseProvider provider,
  ) {
    return call(
      vendorId: provider.vendorId,
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
  String? get name => r'getProductsUseCaseProvider';
}

/// See also [getProductsUseCase].
class GetProductsUseCaseProvider
    extends AutoDisposeProvider<GetProductsUseCase> {
  /// See also [getProductsUseCase].
  GetProductsUseCaseProvider({
    String? vendorId,
  }) : this._internal(
          (ref) => getProductsUseCase(
            ref as GetProductsUseCaseRef,
            vendorId: vendorId,
          ),
          from: getProductsUseCaseProvider,
          name: r'getProductsUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductsUseCaseHash,
          dependencies: GetProductsUseCaseFamily._dependencies,
          allTransitiveDependencies:
              GetProductsUseCaseFamily._allTransitiveDependencies,
          vendorId: vendorId,
        );

  GetProductsUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vendorId,
  }) : super.internal();

  final String? vendorId;

  @override
  Override overrideWith(
    GetProductsUseCase Function(GetProductsUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductsUseCaseProvider._internal(
        (ref) => create(ref as GetProductsUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vendorId: vendorId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<GetProductsUseCase> createElement() {
    return _GetProductsUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductsUseCaseProvider && other.vendorId == vendorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vendorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductsUseCaseRef on AutoDisposeProviderRef<GetProductsUseCase> {
  /// The parameter `vendorId` of this provider.
  String? get vendorId;
}

class _GetProductsUseCaseProviderElement
    extends AutoDisposeProviderElement<GetProductsUseCase>
    with GetProductsUseCaseRef {
  _GetProductsUseCaseProviderElement(super.provider);

  @override
  String? get vendorId => (origin as GetProductsUseCaseProvider).vendorId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
