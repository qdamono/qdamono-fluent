import 'package:fluent_ui/fluent_ui.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorDetails = <String, Color?>{
      'acrylicBackgroundColor': FluentTheme.of(context).acrylicBackgroundColor,
      'activeColor': FluentTheme.of(context).activeColor,
      'cardColor': FluentTheme.of(context).cardColor,
      'inactiveBackgroundColor':
          FluentTheme.of(context).inactiveBackgroundColor,
      'inactiveColor': FluentTheme.of(context).inactiveColor,
      'menuColor': FluentTheme.of(context).menuColor,
      'micaBackgroundColor': FluentTheme.of(context).micaBackgroundColor,
      'scaffoldBackgroundColor':
          FluentTheme.of(context).scaffoldBackgroundColor,
      'selectionColor': FluentTheme.of(context).selectionColor,
      'shadowColor': FluentTheme.of(context).shadowColor,
      'accentColor': FluentTheme.of(context).accentColor,
      'navigationPaneTheme.backgroundColor':
          FluentTheme.of(context).navigationPaneTheme.backgroundColor,
      'navigationPaneTheme.highlightColor':
          FluentTheme.of(context).navigationPaneTheme.highlightColor,
      'navigationPaneTheme.overlayBackgroundColor':
          FluentTheme.of(context).navigationPaneTheme.overlayBackgroundColor,
      'navigationPaneTheme.selectedIconColor (focused)': FluentTheme.of(context)
          .navigationPaneTheme
          .selectedIconColor
          ?.resolve(<ButtonStates>{ButtonStates.focused}),
      'navigationPaneTheme.selectedIconColor (hovering)':
          FluentTheme.of(context)
              .navigationPaneTheme
              .selectedIconColor
              ?.resolve(<ButtonStates>{ButtonStates.hovering}),
      'resources.cardStrokeColorDefault':
          FluentTheme.of(context).resources.cardStrokeColorDefault,
      'resources.controlStrokeColorSecondary':
          FluentTheme.of(context).resources.controlStrokeColorSecondary,
    };

    return ScaffoldPage.withPadding(
      header: PageHeader(
        title: Text(AppLocalizations.of(context).info),
      ),
      content: Column(
        children: [
          ...colorDetails.entries.map(
            (entry) => Row(
              children: [
                Text('${entry.key}${entry.value == null ? ' (null)' : ''}'),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: 100.0,
                  height:
                      FluentTheme.of(context).typography.body?.fontSize ?? 5.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: entry.value,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
