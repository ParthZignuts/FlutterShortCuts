import 'package:get/get.dart';
import '../homescreen/view.dart';
import '../../core/intent/intent.dart';
import '../../core/action/action.dart';
import '../widget/text_form_field.dart';

class ShortcutDemoSlide extends StatefulWidget {
  const ShortcutDemoSlide({Key? key}) : super(key: key);

  @override
  State<ShortcutDemoSlide> createState() => _ShortcutDemoSlideState();
}

class _ShortcutDemoSlideState extends State<ShortcutDemoSlide> {
  int count = 0;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowLeft):const BackIntent(),
          LogicalKeySet(LogicalKeyboardKey.delete): const ClearTextIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC):
              const CopyTextIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowUp): const IncrementIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): const DecrementIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyZ):
              const PasteIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowRight):
              const NextScreenIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyL):
              const AllTextIntent(),
        },
        child: Actions(
          dispatcher: LoggingActionDispatcher(),
          actions: <Type, Action<Intent>>{
            AllTextIntent: AllTextAction(controller),
            ClearTextIntent: ClearTextAction(controller),
            CopyTextIntent: CopyTextAction(controller),
            PasteIntent: PasteTextAction(controller),
            NextScreenIntent:CallbackAction(
              onInvoke: (intent) => Get.offAll(const SeventhSlide()),
            ),
            BackIntent:CallbackAction(
              onInvoke: (intent) => Get.offAll(const SixthSlide()),
            ),
            IncrementIntent: CallbackAction(
              onInvoke: (intent) => setState(() => count++),
            ),
            DecrementIntent: CallbackAction(
              onInvoke: (intent) => setState(() {
                if (count > 0) count--;
              }),
            ),
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('ShortCuts'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: KTextFormField(controller: controller),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => incrementCount(),
                            child: const Icon(Icons.add)),
                        Text('$count'),
                        ElevatedButton(
                            autofocus: false,
                            onPressed: () => decrementCount(),
                            child: const Icon(Icons.remove)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  incrementCount() {
    setState(() {
      count++;
    });
  }

  decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }
}
