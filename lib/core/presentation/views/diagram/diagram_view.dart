import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';

class DiagramView extends ConsumerWidget {
  const DiagramView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPage.withPadding(
      header: PageHeader(
        title: Text(AppLocalizations.of(context).diagram),
      ),
      content: const Placeholder(),
    );
  }
}
