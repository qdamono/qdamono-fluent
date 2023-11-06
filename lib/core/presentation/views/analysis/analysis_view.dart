import 'package:fluent_ui/fluent_ui.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: PageHeader(
        title: Text(AppLocalizations.of(context).analysis),
      ),
      content: const Placeholder(),
    );
  }
}
