import 'package:fluent_ui/fluent_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selection.g.dart';
part 'selection.freezed.dart';

@freezed
class CurrentSelectionData with _$CurrentSelectionData {
  const factory CurrentSelectionData({
    required String text,
    required int lineStart,
    required int lineEnd,
    required int positionStart,
    required int positionEnd,
    required List<Rect> selectionRects,
  }) = _CurrentSelectionData;
}

@riverpod
class CurrentSelection extends _$CurrentSelection {
  @override
  CurrentSelectionData? build() => null;

  void fromSelectionChangedResult(
      SelectionChangedResult selectionChangedResult) {
    print('setting current selection');
    state = CurrentSelectionData(
      text: selectionChangedResult.selectedContent?.plainText ?? '',
      lineStart: selectionChangedResult.lineStart,
      lineEnd: selectionChangedResult.lineEnd,
      positionStart: selectionChangedResult.positionStart,
      positionEnd: selectionChangedResult.positionEnd,
      selectionRects: selectionChangedResult.selectionRects,
    );
  }
}
