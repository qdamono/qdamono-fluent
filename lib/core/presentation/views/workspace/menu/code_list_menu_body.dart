import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/core/application/providers/visual/tags.dart';
import 'package:qdamono_fluent/core/application/providers/workspace/selection.dart';

class CodeListMenuBody extends ConsumerWidget {
  const CodeListMenuBody({super.key});

  Widget _createTagContent(String label, WidgetRef ref, Color color) {
    return Row(
      children: [
        const Text(
          'Code 1',
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: SizedBox(
            width: 10,
            height: 10,
            child: Container(
              color: color,
            ),
          ),
        ),
        Button(
          onPressed: () {
            final currentSelection = ref.read(currentSelectionProvider);

            if (currentSelection != null) {
              ref.read(visibleTagListProvider.notifier).addSelection(
                    currentSelection,
                    color,
                  );
            }
          },
          child: const Icon(
            FluentIcons.tag,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeViewItems = <TreeViewItem>[
      TreeViewItem(
        value: 'Code 1',
        content: _createTagContent('Code 1', ref, Colors.red),
        expanded: false,
        children: [
          TreeViewItem(
            value: 'Code 1 - child 1',
            content: _createTagContent('Code 1 - child 1', ref, Colors.orange),
            expanded: false,
          ),
          TreeViewItem(
            value: 'Code 1 - child 2',
            content: _createTagContent('Code 1 - child 2', ref, Colors.purple),
            expanded: false,
          ),
        ],
      ),
      TreeViewItem(
        value: 'Code 2',
        content: _createTagContent('Code 2', ref, Colors.green),
        expanded: false,
      ),
      TreeViewItem(
        value: 'Code 3',
        content: _createTagContent('Code 3', ref, Colors.magenta),
        expanded: false,
      ),
      TreeViewItem(
        value: 'Code 4',
        content: _createTagContent('Code 4', ref, Colors.teal),
        expanded: false,
      ),
      TreeViewItem(
        value: 'Code 5',
        content: _createTagContent('Code 5', ref, Colors.grey),
        expanded: false,
      ),
    ];

    return TreeView(
      selectionMode: TreeViewSelectionMode.multiple,
      items: treeViewItems,
    );
  }
}
