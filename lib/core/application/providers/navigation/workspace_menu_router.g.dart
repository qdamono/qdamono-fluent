// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_menu_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$menuNavigatorKeyHash() => r'9ad4ac0fea28d5ec933aa0496a341b26ea357fe9';

/// See also [menuNavigatorKey].
@ProviderFor(menuNavigatorKey)
final menuNavigatorKeyProvider = Provider<GlobalKey<NavigatorState>>.internal(
  menuNavigatorKey,
  name: r'menuNavigatorKeyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$menuNavigatorKeyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MenuNavigatorKeyRef = ProviderRef<GlobalKey<NavigatorState>>;
String _$menuBranchNavigatorKeyHash() =>
    r'd191c0475b32b2e456f665d8f5616da70c9b4896';

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

/// See also [menuBranchNavigatorKey].
@ProviderFor(menuBranchNavigatorKey)
const menuBranchNavigatorKeyProvider = MenuBranchNavigatorKeyFamily();

/// See also [menuBranchNavigatorKey].
class MenuBranchNavigatorKeyFamily extends Family<GlobalKey<NavigatorState>> {
  /// See also [menuBranchNavigatorKey].
  const MenuBranchNavigatorKeyFamily();

  /// See also [menuBranchNavigatorKey].
  MenuBranchNavigatorKeyProvider call(
    MenuBranch branch,
  ) {
    return MenuBranchNavigatorKeyProvider(
      branch,
    );
  }

  @override
  MenuBranchNavigatorKeyProvider getProviderOverride(
    covariant MenuBranchNavigatorKeyProvider provider,
  ) {
    return call(
      provider.branch,
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
  String? get name => r'menuBranchNavigatorKeyProvider';
}

/// See also [menuBranchNavigatorKey].
class MenuBranchNavigatorKeyProvider
    extends Provider<GlobalKey<NavigatorState>> {
  /// See also [menuBranchNavigatorKey].
  MenuBranchNavigatorKeyProvider(
    MenuBranch branch,
  ) : this._internal(
          (ref) => menuBranchNavigatorKey(
            ref as MenuBranchNavigatorKeyRef,
            branch,
          ),
          from: menuBranchNavigatorKeyProvider,
          name: r'menuBranchNavigatorKeyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$menuBranchNavigatorKeyHash,
          dependencies: MenuBranchNavigatorKeyFamily._dependencies,
          allTransitiveDependencies:
              MenuBranchNavigatorKeyFamily._allTransitiveDependencies,
          branch: branch,
        );

  MenuBranchNavigatorKeyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.branch,
  }) : super.internal();

  final MenuBranch branch;

  @override
  Override overrideWith(
    GlobalKey<NavigatorState> Function(MenuBranchNavigatorKeyRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MenuBranchNavigatorKeyProvider._internal(
        (ref) => create(ref as MenuBranchNavigatorKeyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        branch: branch,
      ),
    );
  }

  @override
  ProviderElement<GlobalKey<NavigatorState>> createElement() {
    return _MenuBranchNavigatorKeyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MenuBranchNavigatorKeyProvider && other.branch == branch;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, branch.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MenuBranchNavigatorKeyRef on ProviderRef<GlobalKey<NavigatorState>> {
  /// The parameter `branch` of this provider.
  MenuBranch get branch;
}

class _MenuBranchNavigatorKeyProviderElement
    extends ProviderElement<GlobalKey<NavigatorState>>
    with MenuBranchNavigatorKeyRef {
  _MenuBranchNavigatorKeyProviderElement(super.provider);

  @override
  MenuBranch get branch => (origin as MenuBranchNavigatorKeyProvider).branch;
}

String _$filesBranchHash() => r'40f301537b54c4c43aa6ddbf57d54bc199ef05bf';

/// See also [filesBranch].
@ProviderFor(filesBranch)
final filesBranchProvider = Provider<StatefulShellBranch>.internal(
  filesBranch,
  name: r'filesBranchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$filesBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilesBranchRef = ProviderRef<StatefulShellBranch>;
String _$codesBranchHash() => r'c679766dc37f785b51e38f8728d6c574c782d445';

/// See also [codesBranch].
@ProviderFor(codesBranch)
final codesBranchProvider = Provider<StatefulShellBranch>.internal(
  codesBranch,
  name: r'codesBranchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$codesBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CodesBranchRef = ProviderRef<StatefulShellBranch>;
String _$notesBranchHash() => r'1152540eb57e0d9a62967ed5903bca371ff0ec20';

/// See also [notesBranch].
@ProviderFor(notesBranch)
final notesBranchProvider = Provider<StatefulShellBranch>.internal(
  notesBranch,
  name: r'notesBranchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$notesBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotesBranchRef = ProviderRef<StatefulShellBranch>;
String _$menuRootRouteHash() => r'98b3442983609ea2fa551d1d5492e4e4e0d75fbd';

/// See also [menuRootRoute].
@ProviderFor(menuRootRoute)
final menuRootRouteProvider = Provider<StatefulShellRoute>.internal(
  menuRootRoute,
  name: r'menuRootRouteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$menuRootRouteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MenuRootRouteRef = ProviderRef<StatefulShellRoute>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
