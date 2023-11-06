import 'package:multi_split_view/multi_split_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workspace.g.dart';

@riverpod
class SplitViewController extends _$SplitViewController {
  @override
  MultiSplitViewController build() => MultiSplitViewController(
        areas: <Area>[
          Area(size: 300.0),
          Area(),
        ],
      );
}

enum MenuCategory {
  fileTree,
  codeTree,
  noteList,
}

@riverpod
class CurrentMenuCategory extends _$CurrentMenuCategory {
  @override
  MenuCategory build() => MenuCategory.fileTree;
}

@riverpod
class SelectedNoteList extends _$SelectedNoteList {
  @override
  List<String> build() => [];

  void clear() {
    state = [];
  }

  void add(String name) {
    if (state.contains(name)) {
      print('$name is in the selected note list already.');
      return;
    }

    state = [...state, name];
  }

  void remove(String name) {
    final foundIndex = state.indexOf(name);

    if (foundIndex == -1) {
      print('$name is not found in the selected note list.');
      return;
    }

    state.removeAt(foundIndex);

    state = [
      ...state,
    ];
  }
}
