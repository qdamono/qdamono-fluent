import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'workspace_tabs.g.dart';

class TabAlreadyExistsError implements Exception {
  final int index;
  final String name;

  TabAlreadyExistsError({required this.index, required this.name});

  @override
  String toString() {
    return 'Tab with name "$name" is already present at index $index.';
  }
}

class TabDoesNotExistError implements Exception {
  final String name;

  TabDoesNotExistError({required this.name});

  @override
  String toString() {
    return 'Tab with name "$name" is not present.';
  }
}

class TS {
  int index;

  TS({required this.index});
}

@riverpod
class TabList extends _$TabList {
  @override
  List<Tab> build() => [];

  Tab? _findIfPresent(String name) {
    return state.firstWhereOrNull((tab) => tab.semanticLabel == name);
  }

  Tab getTab(String name) {
    return state.firstWhere((tab) => tab.semanticLabel == name);
  }

  bool isTabPresent(String name) {
    return _findIfPresent(name) != null;
  }

  int getIndexOfTab(String name) {
    return state.indexWhere((tab) => tab.semanticLabel == name);
  }

  void assertTabExists(String name) {
    if (!isTabPresent(name)) {
      throw TabDoesNotExistError(name: name);
    }
  }

  void assertTabDoesNotExist(String name) {
    final index = getIndexOfTab(name);

    if (index != -1) {
      throw TabAlreadyExistsError(index: index, name: name);
    }
  }

  int addNewTab(String name, Widget body, void Function() onClosed) {
    assertTabDoesNotExist(name);

    state = [
      ...state,
      Tab(
        text: Text(name),
        body: body,
        semanticLabel: name,
        onClosed: onClosed,
      ),
    ];

    return state.length - 1;
  }

  void closeTab(String name) {
    assertTabExists(name);

    final index = getIndexOfTab(name);

    state = [
      ...state.sublist(0, index),
      ...state.sublist(index + 1, state.length)
    ];
  }

  void reorder(int oldIndex, int newIndex) {
    final tab = state.removeAt(oldIndex);

    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    state.insert(newIndex, tab);
    state = [...state];
  }
}

@riverpod
class SelectedTabIndex extends _$SelectedTabIndex {
  @override
  int build() => 0;

  void set(int newIndex) {
    if (kDebugMode) {
      print('Setting focus on tab index: $newIndex.');
    }

    state = newIndex;
  }
}

@riverpod
class TabManager extends _$TabManager {
  @override
  void build() {
    ref.keepAlive();
  }

  void addNewTab(String name, Widget body) {
    if (kDebugMode) {
      print('TabManager.addNewTab: Adding tab "$name".');
    }

    try {
      ref.read(tabListProvider.notifier).addNewTab(name, body, () {
        closeTab(name);
      });
    } on TabAlreadyExistsError catch (e) {
      if (kDebugMode) {
        print('TabManager.addNewTab: Tab not added: $e');
      }
    }
  }

  void addNewTabWithFocus(String name, Widget body) {
    if (kDebugMode) {
      print('TabManager.addNewTabWithFocus: Adding tab "$name".');
    }

    try {
      final index =
          ref.read(tabListProvider.notifier).addNewTab(name, body, () {
        closeTab(name);
      });
      ref.read(selectedTabIndexProvider.notifier).set(index);
    } on TabAlreadyExistsError catch (e) {
      if (kDebugMode) {
        print('TabManager.addNewTabWithFocus: Tab not added: $e');
      }

      ref.read(selectedTabIndexProvider.notifier).set(e.index);
    }
  }

  void closeTab(String name) {
    if (kDebugMode) {
      print('TabManager.closeTab: Closing tab "$name".');
    }

    ref.read(tabListProvider.notifier).closeTab(name);

    final selectedIndex = ref.read(selectedTabIndexProvider);
    final tabList = ref.read(tabListProvider);

    if (tabList.isNotEmpty && selectedIndex >= tabList.length) {
      ref.read(selectedTabIndexProvider.notifier).set(tabList.length - 1);
    }
  }

  void reorder({required int from, required int to}) {
    // Ex. reverse of 1 -> 0 is 0 -> 2, need to adjust index to 0 -> 1
    final adjustedIndex = to > from ? to - 1 : to;

    if (kDebugMode) {
      print(
          'TabManager.reorder: Reordering tabs from $from to $adjustedIndex.');
    }

    ref.read(tabListProvider.notifier).reorder(from, to);
    ref.read(selectedTabIndexProvider.notifier).set(adjustedIndex);
  }
}
