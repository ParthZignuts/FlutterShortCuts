import 'package:get/get.dart';
import '../../core/action/action_dispatcher.dart';
import '../homescreen/view.dart';
import '../../core/intent/intent.dart';

class SeventhSlide extends StatelessWidget {
  const SeventhSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowLeft):
          const BackIntent(),
        },
        child: Actions(
          dispatcher: LoggingActionDispatcher(),
          actions: <Type, Action<Intent>>{
            BackIntent:CallbackAction(
               onInvoke: (intent) => Get.offAll(const SixthSlide()),
            )
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('ShortCuts'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Thank You Guys', style: TextStyles.header),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('This is All About Shortcuts', style: TextStyles.content),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text('I hope You All Are Understand if Any Question Please Let Me Know',
                      style: TextStyles.content),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Next")),
                  const Flexible(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.bottomCenter, child: Text("7",style: TextStyles.content)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
