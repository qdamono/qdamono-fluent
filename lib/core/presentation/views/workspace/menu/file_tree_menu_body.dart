import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    show SelectionAreaState, SelectionArea, Theme;
import 'package:flutter_markdown_selectionarea/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/core/application/providers/persistent/preferences.dart';
import 'package:qdamono_fluent/core/application/providers/visual/tags.dart';
import 'package:qdamono_fluent/core/application/providers/workspace/selection.dart';
import 'package:qdamono_fluent/core/application/providers/workspace/workspace_tabs.dart';
import 'package:qdamono_fluent/core/presentation/providers/theme.dart';

class FileTreeMenuBody extends ConsumerWidget {
  const FileTreeMenuBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeViewItems = <TreeViewItem>[
      TreeViewItem(
        value: 'file 1',
        content: const Text(
          'file 1',
          overflow: TextOverflow.ellipsis,
        ),
        expanded: false,
        children: [
          TreeViewItem(
            value: 'file 1 - coding 1',
            content: const Text(
              'file 1 - conding 1',
              overflow: TextOverflow.ellipsis,
            ),
            expanded: false,
          ),
          TreeViewItem(
            value: 'file 1 - coding 2',
            content: const Text(
              'file 1 - conding 2',
              overflow: TextOverflow.ellipsis,
            ),
            expanded: false,
          ),
        ],
      ),
      TreeViewItem(
        value: 'file 2',
        content: const Text(
          'file 2',
          overflow: TextOverflow.ellipsis,
        ),
        expanded: false,
      ),
      TreeViewItem(
        value: 'file 3',
        content: const Text(
          'file 3',
          overflow: TextOverflow.ellipsis,
        ),
        expanded: false,
        children: [
          TreeViewItem(
            value: 'file 3 - coding 1',
            content: const Text(
              'file 3 - conding 1',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ];

    return TreeView(
      selectionMode: TreeViewSelectionMode.multiple,
      items: treeViewItems,
      gesturesBuilder: (item) {
        Timer? tapDownTimer;

        return <Type, GestureRecognizerFactory>{
          MultiTapGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<MultiTapGestureRecognizer>(
            () => MultiTapGestureRecognizer(
              longTapDelay: const Duration(
                milliseconds: 400,
              ),
            ),
            (MultiTapGestureRecognizer instance) {
              instance.onTapDown = (int pointer, TapDownDetails details) {
                if (tapDownTimer != null) {
                  tapDownTimer?.cancel();
                  tapDownTimer = null;

                  ref
                      .read(tabManagerProvider.notifier)
                      .addNewTabWithFocus(item.value, TestTabBody());
                } else {
                  tapDownTimer = Timer(const Duration(milliseconds: 300), () {
                    tapDownTimer = null;
                  });
                }
              };
            },
          ),
        };
      },
    );
  }
}

class TestTabBody extends ConsumerStatefulWidget {
  const TestTabBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestTabBodyState();
}

class _TestTabBodyState extends ConsumerState<TestTabBody> {
  final _markdownKey =
      GlobalKey<MarkdownWidgetState>(debugLabel: 'MarkdownKey');
  final _selectionAreaKey =
      GlobalKey<SelectionAreaState>(debugLabel: 'SelectionAreaKey');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = ref.watch(appPreferencesProvider.select(
      (prefs) => prefs.bodyFontSize,
    ));

    return ScaffoldPage.scrollable(
      children: [
        Stack(
          children: [
            const Positioned.fill(
              child: VisibleTagLayer(),
            ),
            SelectionArea(
              key: _selectionAreaKey,
              onSelectionChanged: (selectionChangedResult) {
                ref
                    .read(currentSelectionProvider.notifier)
                    .fromSelectionChangedResult(selectionChangedResult);
              },
              contextMenuBuilder: (context, selectableRegionState) =>
                  AdaptiveTextSelectionToolbar.buttonItems(
                buttonItems: <ContextMenuButtonItem>[
                  // ...selectableRegionState.contextMenuButtonItems,
                  ContextMenuButtonItem(
                    onPressed: () {
                      final currentSelection =
                          ref.read(currentSelectionProvider);
                      if (currentSelection != null) {
                        ref.read(visibleTagListProvider.notifier).addSelection(
                              currentSelection,
                              Colors.green,
                            );
                      }
                      ContextMenuController.removeAny();
                    },
                    label: 'Code 1',
                  ),
                  ContextMenuButtonItem(
                    onPressed: () {
                      final currentSelection =
                          ref.read(currentSelectionProvider);
                      if (currentSelection != null) {
                        ref.read(visibleTagListProvider.notifier).addSelection(
                              currentSelection,
                              Colors.red,
                            );
                      }
                      ContextMenuController.removeAny();
                    },
                    label: 'Code 2',
                  ),
                ],
                anchors: selectableRegionState.contextMenuAnchors,
              ),
              child: Text.rich(
                WidgetSpan(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: MarkdownBody(
                      key: _markdownKey,
                      styleSheet: MarkdownStyleSheet.fromTheme(
                        Theme.of(context).copyWith(
                          textTheme: Theme.of(context).textTheme.copyWith(
                                // p
                                bodyMedium: FluentTheme.of(context)
                                    .typography
                                    .body!
                                    .copyWith(
                                      fontSize: fontSize.toDouble(),
                                    ),
                                // h1
                                headlineSmall: FluentTheme.of(context)
                                    .typography
                                    .title!
                                    .copyWith(
                                        fontSize: FluentTheme.of(context)
                                                .typography
                                                .titleLarge!
                                                .fontSize! *
                                            fontSize.toDouble() /
                                            FluentTheme.of(context)
                                                .typography
                                                .body!
                                                .fontSize!),
                                // h2
                                titleLarge: FluentTheme.of(context)
                                    .typography
                                    .title!
                                    .copyWith(
                                        fontSize: FluentTheme.of(context)
                                                .typography
                                                .title!
                                                .fontSize! *
                                            fontSize.toDouble() /
                                            FluentTheme.of(context)
                                                .typography
                                                .body!
                                                .fontSize!),
                                // h3
                                titleMedium: FluentTheme.of(context)
                                    .typography
                                    .title!
                                    .copyWith(
                                        fontSize: 0.85 *
                                            FluentTheme.of(context)
                                                .typography
                                                .title!
                                                .fontSize! *
                                            fontSize.toDouble() /
                                            FluentTheme.of(context)
                                                .typography
                                                .body!
                                                .fontSize!),
                                // h4, h5, h6
                                bodyLarge: FluentTheme.of(context)
                                    .typography
                                    .title!
                                    .copyWith(
                                        fontSize: FluentTheme.of(context)
                                                .typography
                                                .bodyLarge!
                                                .fontSize! *
                                            fontSize.toDouble() /
                                            FluentTheme.of(context)
                                                .typography
                                                .body!
                                                .fontSize!),
                              ),
                        ),
                      ),
                      data: '''# h1
## h2
### h3
#### h4
##### h5
The standard Lorem Ipsum passage, used since the 1500s

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
- bullet 1
- bullet 2

''',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        Button(
          onPressed: () {
            ref.read(visibleTagListProvider.notifier).clear();
          },
          child: const Text('clear visible tags'),
        ),
        const CurrentSelectionPreview(),
      ],
    );
  }
}

class CurrentSelectionPreview extends ConsumerWidget {
  const CurrentSelectionPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSelection = ref.watch(currentSelectionProvider);
    return Text(currentSelection?.text ?? '');
  }
}

class BodyTextElementBuilder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return Consumer(
      builder: (context, ref, child) {
        final fontSize = ref.watch(appPreferencesProvider.select(
          (prefs) => prefs.bodyFontSize,
        ));

        return Text(
          text.text,
          style: FluentThemeData.dark()
              .typography
              .body!
              .copyWith(fontSize: fontSize.toDouble()),
        );
      },
    );
  }
}

class SelectableContent extends ConsumerWidget {
  const SelectableContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = ref.watch(appPreferencesProvider.select(
      (prefs) => prefs.bodyFontSize,
    ));

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Text(
        '''The standard Lorem Ipsum passage, used since the 1500s
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."''',
        style: FluentTheme.of(context).typography.body!.copyWith(
              fontSize: fontSize.toDouble(),
            ),
      ),
    );
  }
}

class MarkdownParser implements md.NodeVisitor {
  void parse(String content) {
    final lines = content.split('\n');
    final document = md.Document(encodeHtml: false);
    for (var node in document.parseLines(lines)) {
      node.accept(this);
    }
  }

  @override
  void visitElementAfter(md.Element element) {
    print('element after: ${element.tag}');
  }

  @override
  bool visitElementBefore(md.Element element) {
    print('element before: ${element.tag}');
    return true;
  }

  @override
  void visitText(md.Text text) {
    print('text: ${text.textContent}');
  }
}

class VisibleTagLayer extends ConsumerStatefulWidget {
  const VisibleTagLayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VisibleTagLayerState();
}

class TagRect {
  Rect rect;
  Color color;

  TagRect({
    required this.rect,
    required this.color,
  });
}

class _VisibleTagLayerState extends ConsumerState<VisibleTagLayer> {
  final _paintKey = GlobalKey();
  List<TagRect> rects = [];

  @override
  Widget build(BuildContext context) {
    ref.listen(visibleTagListProvider, (_, newValue) {
      rects.clear();
      final renderBox =
          _paintKey.currentContext!.findRenderObject()! as RenderBox;
      setState(() {
        rects = newValue.map(
          (tagData) {
            final topLeft = renderBox.globalToLocal(tagData.rect.topLeft);
            final bottomRight =
                renderBox.globalToLocal(tagData.rect.bottomRight);
            return TagRect(
              rect: Rect.fromPoints(topLeft, bottomRight),
              color: tagData.color,
            );
          },
        ).toList();
      });
    });

    return CustomPaint(
      key: _paintKey,
      painter: VisibleTagPainter(
        tagRects: rects,
      ),
      child: const SizedBox.shrink(),
    );
  }
}

class VisibleTagPainter extends CustomPainter {
  final List<TagRect> tagRects;

  VisibleTagPainter({
    required this.tagRects,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final tagRect in tagRects) {
      paint.color = tagRect.color;
      canvas.drawRect(tagRect.rect.inflate(1.0), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
