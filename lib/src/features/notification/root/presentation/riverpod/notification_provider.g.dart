// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationHash() => r'e099a90141d2e3f14ab6292ae7a555c3e4320759';

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

/// See also [notification].
@ProviderFor(notification)
const notificationProvider = NotificationFamily();

/// See also [notification].
class NotificationFamily extends Family<AsyncValue<List<NotificationEntity>>> {
  /// See also [notification].
  const NotificationFamily();

  /// See also [notification].
  NotificationProvider call(
    String type,
  ) {
    return NotificationProvider(
      type,
    );
  }

  @override
  NotificationProvider getProviderOverride(
    covariant NotificationProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'notificationProvider';
}

/// See also [notification].
class NotificationProvider extends FutureProvider<List<NotificationEntity>> {
  /// See also [notification].
  NotificationProvider(
    String type,
  ) : this._internal(
          (ref) => notification(
            ref as NotificationRef,
            type,
          ),
          from: notificationProvider,
          name: r'notificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$notificationHash,
          dependencies: NotificationFamily._dependencies,
          allTransitiveDependencies:
              NotificationFamily._allTransitiveDependencies,
          type: type,
        );

  NotificationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final String type;

  @override
  Override overrideWith(
    FutureOr<List<NotificationEntity>> Function(NotificationRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NotificationProvider._internal(
        (ref) => create(ref as NotificationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  FutureProviderElement<List<NotificationEntity>> createElement() {
    return _NotificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NotificationRef on FutureProviderRef<List<NotificationEntity>> {
  /// The parameter `type` of this provider.
  String get type;
}

class _NotificationProviderElement
    extends FutureProviderElement<List<NotificationEntity>>
    with NotificationRef {
  _NotificationProviderElement(super.provider);

  @override
  String get type => (origin as NotificationProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
