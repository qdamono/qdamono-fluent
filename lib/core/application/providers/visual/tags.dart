import 'package:fluent_ui/fluent_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qdamono_fluent/core/application/providers/workspace/selection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tags.g.dart';
part 'tags.freezed.dart';

@freezed
class VisibleTagData with _$VisibleTagData {
  const factory VisibleTagData({
    required Rect rect,
    required Color color,
  }) = _VisibleTagData;
}

@riverpod
class VisibleTagList extends _$VisibleTagList {
  @override
  List<VisibleTagData> build() => [];

  void addSelection(CurrentSelectionData currentSelectionData, Color color) {
    state = [
      ...state,
      ...currentSelectionData.selectionRects.map(
        (e) => VisibleTagData(rect: e, color: color),
      ),
    ];
  }

  void clear() {
    state = [];
  }
}
