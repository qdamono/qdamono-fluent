import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show SelectionArea;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qdamono_fluent/core/application/providers/persistent/preferences.dart';
import 'package:qdamono_fluent/core/application/providers/workspace/workspace.dart';
import 'package:qdamono_fluent/core/application/providers/workspace/workspace_tabs.dart';

part 'note_list_menu_body.freezed.dart';

@freezed
class NoteItem with _$NoteItem {
  const factory NoteItem({
    required String name,
  }) = _NoteItem;
}

class NoteListMenuBody extends ConsumerWidget {
  const NoteListMenuBody({super.key});

  static const listViewItems = <NoteItem>[
    NoteItem(name: 'Note 1'),
    NoteItem(name: 'Note 2'),
    NoteItem(name: 'Note 3'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNoteList = ref.watch(selectedNoteListProvider);

    return ListView.builder(
      itemCount: listViewItems.length,
      itemBuilder: (context, index) {
        final item = listViewItems[index];

        Timer? pressedTimer;

        return ListTile.selectable(
          title:
              Text(item.name, style: FluentTheme.of(context).typography.body),
          selected: selectedNoteList.contains(item.name),
          onSelectionChange: (isSelected) {},
          onPressed: () {
            if (pressedTimer != null) {
              pressedTimer?.cancel();
              pressedTimer = null;

              ref
                  .read(tabManagerProvider.notifier)
                  .addNewTabWithFocus(item.name, const TestNoteTabBody());
            } else {
              pressedTimer = Timer(const Duration(milliseconds: 300), () {
                pressedTimer = null;
              });
            }
          },
        );
      },
    );
  }
}

class TestNoteTabBody extends ConsumerWidget {
  const TestNoteTabBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = ref.watch(appPreferencesProvider.select(
      (prefs) => prefs.bodyFontSize,
    ));

    return ScaffoldPage.scrollable(
      children: [
        SelectionArea(
          child: Text.rich(
            WidgetSpan(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                child: Text(
                  '''The standard Lorem Ipsum passage, used since the 1500s
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
              
              Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC
              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
              
              1914 translation by H. Rackham
              "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"''',
                  style: FluentTheme.of(context).typography.body!.copyWith(
                        fontSize: fontSize.toDouble(),
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
