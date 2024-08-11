// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_details_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductDetailsUseCaseHash() =>
    r'f54ba7c053cd1849bc4b842ecf9f9a0b80a31843';

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

/// See also [getProductDetailsUseCase].
@ProviderFor(getProductDetailsUseCase)
const getProductDetailsUseCaseProvider = GetProductDetailsUseCaseFamily();

/// See also [getProductDetailsUseCase].
class GetProductDetailsUseCaseFamily extends Family<GetProductDetailsUseCase> {
  /// See also [getProductDetailsUseCase].
  const GetProductDetailsUseCaseFamily();

  /// See also [getProductDetailsUseCase].
  GetProductDetailsUseCaseProvider call({
    required String productId,
  }) {
    return GetProductDetailsUseCaseProvider(
      productId: productId,
    );
  }

  @override
  GetProductDetailsUseCaseProvider getProviderOverride(
    covariant GetProductDetailsUseCaseProvider provider,
  ) {
    return call(
      productId: provider.productId,
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
  String? get name => r'getProductDetailsUseCaseProvider';
}

/// See also [getProductDetailsUseCase].
class GetProductDetailsUseCaseProvider
    extends AutoDisposeProvider<GetProductDetailsUseCase> {
  /// See also [getProductDetailsUseCase].
  GetProductDetailsUseCaseProvider({
    required String productId,
  }) : this._internal(
          (ref) => getProductDetailsUseCase(
            ref as GetProductDetailsUseCaseRef,
            productId: productId,
          ),
          from: getProductDetailsUseCaseProvider,
          name: r'getProductDetailsUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductDetailsUseCaseHash,
          dependencies: GetProductDetailsUseCaseFamily._dependencies,
          allTransitiveDependencies:
              GetProductDetailsUseCaseFamily._allTransitiveDependencies,
          productId: productId,
        );

  GetProductDetailsUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  Override overrideWith(
    GetProductDetailsUseCase Function(GetProductDetailsUseCaseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductDetailsUseCaseProvider._internal(
        (ref) => create(ref as GetProductDetailsUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<GetProductDetailsUseCase> createElement() {
    return _GetProductDetailsUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductDetailsUseCaseProvider &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductDetailsUseCaseRef
    on AutoDisposeProviderRef<GetProductDetailsUseCase> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _GetProductDetailsUseCaseProviderElement
    extends AutoDisposeProviderElement<GetProductDetailsUseCase>
    with GetProductDetailsUseCaseRef {
  _GetProductDetailsUseCaseProviderElement(super.provider);

  @override
  String get productId =>
      (origin as GetProductDetailsUseCaseProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
