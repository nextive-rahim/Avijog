// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentHistoryHash() => r'2d138f1d27479249e6ccd555126fd0af0ef3657d';

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

/// See also [paymentHistory].
@ProviderFor(paymentHistory)
const paymentHistoryProvider = PaymentHistoryFamily();

/// See also [paymentHistory].
class PaymentHistoryFamily
    extends Family<AsyncValue<List<PaymentHistoryModel>>> {
  /// See also [paymentHistory].
  const PaymentHistoryFamily();

  /// See also [paymentHistory].
  PaymentHistoryProvider call(
    String month,
    String year,
  ) {
    return PaymentHistoryProvider(
      month,
      year,
    );
  }

  @override
  PaymentHistoryProvider getProviderOverride(
    covariant PaymentHistoryProvider provider,
  ) {
    return call(
      provider.month,
      provider.year,
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
  String? get name => r'paymentHistoryProvider';
}

/// See also [paymentHistory].
class PaymentHistoryProvider extends FutureProvider<List<PaymentHistoryModel>> {
  /// See also [paymentHistory].
  PaymentHistoryProvider(
    String month,
    String year,
  ) : this._internal(
          (ref) => paymentHistory(
            ref as PaymentHistoryRef,
            month,
            year,
          ),
          from: paymentHistoryProvider,
          name: r'paymentHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentHistoryHash,
          dependencies: PaymentHistoryFamily._dependencies,
          allTransitiveDependencies:
              PaymentHistoryFamily._allTransitiveDependencies,
          month: month,
          year: year,
        );

  PaymentHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
    required this.year,
  }) : super.internal();

  final String month;
  final String year;

  @override
  Override overrideWith(
    FutureOr<List<PaymentHistoryModel>> Function(PaymentHistoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PaymentHistoryProvider._internal(
        (ref) => create(ref as PaymentHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
        year: year,
      ),
    );
  }

  @override
  FutureProviderElement<List<PaymentHistoryModel>> createElement() {
    return _PaymentHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentHistoryProvider &&
        other.month == month &&
        other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PaymentHistoryRef on FutureProviderRef<List<PaymentHistoryModel>> {
  /// The parameter `month` of this provider.
  String get month;

  /// The parameter `year` of this provider.
  String get year;
}

class _PaymentHistoryProviderElement
    extends FutureProviderElement<List<PaymentHistoryModel>>
    with PaymentHistoryRef {
  _PaymentHistoryProviderElement(super.provider);

  @override
  String get month => (origin as PaymentHistoryProvider).month;
  @override
  String get year => (origin as PaymentHistoryProvider).year;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
