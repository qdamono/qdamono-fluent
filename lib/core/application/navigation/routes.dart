abstract class AppRoute {
  String get name;
  String get path;
}

enum RootBranch {
  home,
  workspace,
  analysis,
  diagram,
  info,
  settings;

  @override
  String toString() {
    return switch (this) {
      RootBranch.home => 'home',
      RootBranch.workspace => 'workspace',
      RootBranch.analysis => 'analysis',
      RootBranch.diagram => 'diagram',
      RootBranch.info => 'info',
      RootBranch.settings => 'settings',
    };
  }
}

enum HomeRoute implements AppRoute {
  root,
  projectList;

  @override
  String get name {
    return switch (this) {
      HomeRoute.root => 'home',
      HomeRoute.projectList => 'project_list',
    };
  }

  @override
  String get path {
    return switch (this) {
      HomeRoute.root => '/home',
      HomeRoute.projectList => 'project_list',
    };
  }
}

enum WorkspaceRoute implements AppRoute {
  root;

  @override
  String get name {
    return switch (this) {
      WorkspaceRoute.root => 'workspace',
    };
  }

  @override
  String get path {
    return switch (this) {
      WorkspaceRoute.root => '/workspace',
    };
  }
}

enum AnalysisRoute implements AppRoute {
  root;

  @override
  String get name {
    return switch (this) {
      AnalysisRoute.root => 'analysis',
    };
  }

  @override
  String get path {
    return switch (this) {
      AnalysisRoute.root => '/analysis',
    };
  }
}

enum DiagramRoute implements AppRoute {
  root;

  @override
  String get name {
    return switch (this) {
      DiagramRoute.root => 'diagram',
    };
  }

  @override
  String get path {
    return switch (this) {
      DiagramRoute.root => '/diagram',
    };
  }
}

enum InfoRoute implements AppRoute {
  root;

  @override
  String get name {
    return switch (this) {
      InfoRoute.root => 'info',
    };
  }

  @override
  String get path {
    return switch (this) {
      InfoRoute.root => '/info',
    };
  }
}

enum SettingsRoute implements AppRoute {
  root;

  @override
  String get name {
    return switch (this) {
      SettingsRoute.root => 'settings',
    };
  }

  @override
  String get path {
    return switch (this) {
      SettingsRoute.root => '/settings',
    };
  }
}
