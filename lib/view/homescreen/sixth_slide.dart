import 'package:get/get.dart';
import '../../core/action/action_dispatcher.dart';
import '../homescreen/view.dart';
import '../../core/intent/intent.dart';


class SixthSlide extends StatelessWidget {
  const SixthSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Dispatcher'),
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
                onInvoke: (intent) => Get.offAll(const ShortcutDemoSlide()),
              ),
              BackIntent: CallbackAction(
                onInvoke: (intent) => Get.offAll(const FifthSlide()),
              )
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Align(alignment:Alignment.center,child: Text('Action Dispatcher', style: TextStyles.header)),
                SizedBox(
                  height: 10,
                ),
                Focus(
                  autofocus: true,
                  child: Text(
                    '=> Most of the time, you just want to invoke an action, have it do its thing, and forget about it.',
                    style: TextStyles.content,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '=> So that time Action Dispatcher Will be came in picture , It Will Help us to To add Log on Executed Actions.',
                  style: TextStyles.content,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '=> So Main and Important things is that Action Dispatcher will Be used to log the Executed Action. ',
                  style: TextStyles.content,
                ),
                Flexible(
                  flex: 1,
                  child:  Align(
                      alignment: Alignment.bottomCenter, child: Text("6",style: TextStyles.content)),
                ),
              ],
            )),
      ),
    );
  }
}
