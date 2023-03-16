import 'package:get/get.dart';
import '../homescreen/view.dart';
import '../../core/intent/intent.dart';
import '../../core/action/action.dart';

class ShortcutDemoSlide extends StatefulWidget {
  const ShortcutDemoSlide({Key? key}) : super(key: key);

  @override
  State<ShortcutDemoSlide> createState() => _ShortcutDemoSlideState();
}

class _ShortcutDemoSlideState extends State<ShortcutDemoSlide> {
  int count = 0;
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowLeft): const BackIntent(),
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
            NextScreenIntent: NextScreenAction(
                onNextSlide: () => Get.offAll(const SeventhSlide())),
            // Avoid it
            BackIntent: BackSlideAction(
                onBackSlide: () => Get.offAll(const SixthSlide())),
            // Prefer to use this
            IncrementIntent: SetCounterAction(
                perform: () => setState(() {
                      count++;
                    })),
            //don't use CallbackAction
            DecrementIntent: CallbackAction(
              onInvoke: (intent) => setState(() {
                if (count > 0) count--;
              }),
            ),
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Ctrl + c : To Copy Text"),
                const Text("Ctrl + z : To Paste Text"),
                const Text("Delete  : To Clear All Text"),
                const Text("UpArrow  : To Increment Values"),
                const Text("Down Arrow  : To Decrement Values"),
                const SizedBox(
                  height: 15,
                ),
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
                          child: const Icon(Icons.arrow_upward)),
                      Focus(autofocus: true, child: Text('$count')),
                      ElevatedButton(
                          autofocus: false,
                          onPressed: () => decrementCount(),
                          child: const Icon(Icons.arrow_downward)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Text(
        "7",
        textAlign: TextAlign.center,
      ),
    );
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
