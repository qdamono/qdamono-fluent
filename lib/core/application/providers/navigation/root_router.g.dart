// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rootNavigatorKeyHash() => r'b56e7f0015c7cf35db3679e9cd147b74c290650d';

/// See also [rootNavigatorKey].
@ProviderFor(rootNavigatorKey)
final rootNavigatorKeyProvider = Provider<GlobalKey<NavigatorState>>.internal(
  rootNavigatorKey,
  name: r'rootNavigatorKeyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rootNavigatorKeyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RootNavigatorKeyRef = ProviderRef<GlobalKey<NavigatorState>>;
String _$branchNavigatorKeyHash() =>
    r'770d51d3725d7e0083c6e19f9a4cd2eb98e045c4';

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

/// See also [branchNavigatorKey].
@ProviderFor(branchNavigatorKey)
const branchNavigatorKeyProvider = BranchNavigatorKeyFamily();

/// See also [branchNavigatorKey].
class BranchNavigatorKeyFamily extends Family<GlobalKey<NavigatorState>> {
  /// See also [branchNavigatorKey].
  const BranchNavigatorKeyFamily();

  /// See also [branchNavigatorKey].
  BranchNavigatorKeyProvider call(
    RootBranch branch,
  ) {
    return BranchNavigatorKeyProvider(
      branch,
    );
  }

  @override
  BranchNavigatorKeyProvider getProviderOverride(
    covariant BranchNavigatorKeyProvider provider,
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
  String? get name => r'branchNavigatorKeyProvider';
}

/// See also [branchNavigatorKey].
class BranchNavigatorKeyProvider extends Provider<GlobalKey<NavigatorState>> {
  /// See also [branchNavigatorKey].
  BranchNavigatorKeyProvider(
    RootBranch branch,
  ) : this._internal(
          (ref) => branchNavigatorKey(
            ref as BranchNavigatorKeyRef,
            branch,
          ),
          from: branchNavigatorKeyProvider,
          name: r'branchNavigatorKeyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$branchNavigatorKeyHash,
          dependencies: BranchNavigatorKeyFamily._dependencies,
          allTransitiveDependencies:
              BranchNavigatorKeyFamily._allTransitiveDependencies,
          branch: branch,
        );

  BranchNavigatorKeyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.branch,
  }) : super.internal();

  final RootBranch branch;

  @override
  Override overrideWith(
    GlobalKey<NavigatorState> Function(BranchNavigatorKeyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BranchNavigatorKeyProvider._internal(
        (ref) => create(ref as BranchNavigatorKeyRef),
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
    return _BranchNavigatorKeyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BranchNavigatorKeyProvider && other.branch == branch;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, branch.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BranchNavigatorKeyRef on ProviderRef<GlobalKey<NavigatorState>> {
  /// The parameter `branch` of this provider.
  RootBranch get branch;
}

class _BranchNavigatorKeyProviderElement
    extends ProviderElement<GlobalKey<NavigatorState>>
    with BranchNavigatorKeyRef {
  _BranchNavigatorKeyProviderElement(super.provider);

  @override
  RootBranch get branch => (origin as BranchNavigatorKeyProvider).branch;
}

String _$homeBranchHash() => r'706574161d8c2a09a15a3fbc687036244af206b2';

/// See also [homeBranch].
@ProviderFor(homeBranch)
final homeBranchProvider = Provider<StatefulShellBranch>.internal(
  homeBranch,
  name: r'homeBranchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HomeBranchRef = ProviderRef<StatefulShellBranch>;
String _$workspaceBranchHash() => r'5137acea0a31f0fa20332a7bb1acb2ed5fc6a490';

/// See also [workspaceBranch].
@ProviderFor(workspaceBranch)
final workspaceBranchProvider = Provider<StatefulShellBranch>.internal(
  workspaceBranch,
  name: r'workspaceBranchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workspaceBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorkspaceBranchRef = ProviderRef<StatefulShellBranch>;
String _$analysisBranchHash() => r'415d3012aa48233f3ae737ca52730c847d35248d';

/// See also [analysisBranch].
@ProviderFor(analysisBranch)
final analysisBranchProvider = Provider<StatefulShellBranch>.internal(
  analysisBranch,
  name: r'analysisBranchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analysisBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnalysisBranchRef = ProviderRef<StatefulShellBranch>;
String _$diagramBranchHash() => r'25341b5ac35e779df5099c26bdc913f5b77200b9';

/// See also [diagramBranch].
@ProviderFor(diagramBranch)
final diagramBranchProvider = Provider<StatefulShellBranch>.internal(
  diagramBranch,
  name: r'diagramBranchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$diagramBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DiagramBranchRef = ProviderRef<StatefulShellBranch>;
String _$infoBranchHash() => r'69e08d045163030f12458bb5ac0ef054f84e998a';

/// See also [infoBranch].
@ProviderFor(infoBranch)
final infoBranchProvider = Provider<StatefulShellBranch>.internal(
  infoBranch,
  name: r'infoBranchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$infoBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InfoBranchRef = ProviderRef<StatefulShellBranch>;
String _$settingsBranchHash() => r'6c6ff0de20af3ab35e8be9181dbe3448b3ce83e8';

/// See also [settingsBranch].
@ProviderFor(settingsBranch)
final settingsBranchProvider = Provider<StatefulShellBranch>.internal(
  settingsBranch,
  name: r'settingsBranchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsBranchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SettingsBranchRef = ProviderRef<StatefulShellBranch>;
String _$branchListHash() => r'95fed1ff92eea451fe7c05d7f9a9328b37809aa1';

/// See also [branchList].
@ProviderFor(branchList)
final branchListProvider = Provider<List<StatefulShellBranch>>.internal(
  branchList,
  name: r'branchListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$branchListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BranchListRef = ProviderRef<List<StatefulShellBranch>>;
String _$rootRouteListHash() => r'04abf4a29ed0042e3dfda0821d1a8d5e8b23e3fe';

/// See also [rootRouteList].
@ProviderFor(rootRouteList)
final rootRouteListProvider = Provider<List<RouteBase>>.internal(
  rootRouteList,
  name: r'rootRouteListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rootRouteListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RootRouteListRef = ProviderRef<List<RouteBase>>;
String _$rootRouterHash() => r'35f159407b1d0709850d0571676b5e44c00e6984';

/// See also [rootRouter].
@ProviderFor(rootRouter)
final rootRouterProvider = Provider<GoRouter>.internal(
  rootRouter,
  name: r'rootRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$rootRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RootRouterRef = ProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
