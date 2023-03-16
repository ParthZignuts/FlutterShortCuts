import 'package:get/get.dart';
import '../../core/action/action_dispatcher.dart';
import '../homescreen/view.dart';
import '../../core/intent/intent.dart';

class ThirdSlide extends StatelessWidget {
  const ThirdSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shortcuts'),
        centerTitle: true,
      ),
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowRight):
              const NextScreenIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft): const BackIntent(),
        },
        child: Actions(
            dispatcher: LoggingActionDispatcher(),
            actions: <Type, Action<Intent>>{
              NextScreenIntent: CallbackAction(
                onInvoke: (intent) => Get.offAll(const FourthSlide()),
              ),
              BackIntent: CallbackAction(
                onInvoke: (intent) => Get.offAll(const SecondSlide()),
              )
            },
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('ShortCuts:', style: TextStyles.header),
                const SizedBox(
                  height: 10,
                ),
                const Focus(
                  autofocus: true,
                  child:  Text(
                    '=>See the bellow image, it’s the straightforward architecture of this new system.',
                    style: TextStyles.content,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(child: Image.asset('assets/images/img.png')),

                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "3",
                      style: TextStyles.content,
                    )),
              ],
            )),
      ),
    );
  }
}
