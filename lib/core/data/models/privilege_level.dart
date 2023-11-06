enum PrivilegeLevel {
  unauthorized,
  guest,
  contributor,
  maintainer,
  owner;

  get value {
    return switch (this) {
      PrivilegeLevel.unauthorized => 0,
      PrivilegeLevel.guest => 0,
      PrivilegeLevel.contributor => 0,
      PrivilegeLevel.maintainer => 0,
      PrivilegeLevel.owner => 0,
    };
  }
}
