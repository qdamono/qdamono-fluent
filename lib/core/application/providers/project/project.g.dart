// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectHash() => r'22735ad1562a440daa7c1e855ab049fee8ed3f47';

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

abstract class _$Project
    extends BuildlessAutoDisposeAsyncNotifier<ProjectState> {
  late final String id;

  Future<ProjectState> build(
    String id,
  );
}

/// See also [Project].
@ProviderFor(Project)
const projectProvider = ProjectFamily();

/// See also [Project].
class ProjectFamily extends Family<AsyncValue<ProjectState>> {
  /// See also [Project].
  const ProjectFamily();

  /// See also [Project].
  ProjectProvider call(
    String id,
  ) {
    return ProjectProvider(
      id,
    );
  }

  @override
  ProjectProvider getProviderOverride(
    covariant ProjectProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'projectProvider';
}

/// See also [Project].
class ProjectProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Project, ProjectState> {
  /// See also [Project].
  ProjectProvider(
    String id,
  ) : this._internal(
          () => Project()..id = id,
          from: projectProvider,
          name: r'projectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectHash,
          dependencies: ProjectFamily._dependencies,
          allTransitiveDependencies: ProjectFamily._allTransitiveDependencies,
          id: id,
        );

  ProjectProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Future<ProjectState> runNotifierBuild(
    covariant Project notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(Project Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Project, ProjectState>
      createElement() {
    return _ProjectProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProjectRef on AutoDisposeAsyncNotifierProviderRef<ProjectState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProjectProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Project, ProjectState>
    with ProjectRef {
  _ProjectProviderElement(super.provider);

  @override
  String get id => (origin as ProjectProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
