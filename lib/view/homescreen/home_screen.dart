import 'package:shortcuts/core/action/next_screen_action.dart';
import 'package:shortcuts/core/action/pastetext_action.dart';
import 'package:shortcuts/core/intent/pastetext_intent.dart';
import '../../core/intent/next_screen_intent.dart';
import '../widget/text_form_field.dart';
import '../../core/action/action.dart';
import '../../core/intent/intent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.delete): const ClearTextIntent(),
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit0): const CopyTextIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowUp): const IncrementIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): const DecrementIntent(),
          LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyZ):const PasteIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowRight):const NextScreenIntent(),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            ClearTextIntent: ClearTextAction(controller),
            CopyTextIntent: CopyTextAction(controller),
            PasteIntent:PasteTextAction(controller),
            NextScreenIntent:NextScreenAction(context),
            IncrementIntent: CallbackAction(onInvoke: (intent) => setState(() => count++),
            ),
            DecrementIntent: CallbackAction(onInvoke: (intent) => setState((){if(count>0) count--;}),
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
                  Row(
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
