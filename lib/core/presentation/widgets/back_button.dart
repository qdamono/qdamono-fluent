import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/core/application/providers/navigation/app_nav.dart';

class BackButton extends ConsumerStatefulWidget {
  const BackButton({super.key});

  @override
  ConsumerState<BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends ConsumerState<BackButton> {
  bool canPopRoute = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void refreshButtonState() {
    final canPopNow = ref.read(appNavProvider).canPop();

    if (canPopRoute != canPopNow) {
      setState(() {
        canPopRoute = canPopNow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      refreshButtonState();
    });

    onPressed() {
      AppNav.of(context).pop();
    }

    return Builder(
      builder: (context) => PaneItem(
        icon: const Center(child: Icon(FluentIcons.back, size: 12.0)),
        title: const Text('Go back'),
        body: const SizedBox.shrink(),
        enabled: canPopRoute,
      ).build(
        context,
        false,
        onPressed,
        displayMode: PaneDisplayMode.compact,
      ),
    );
  }
}
