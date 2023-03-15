import 'package:get/get.dart';
import '../homescreen/view.dart';
import '../../core/intent/intent.dart';


class FifthSlide extends StatelessWidget {
  const FifthSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actions'),
        centerTitle: true,
      ),
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowRight):
          const NextScreenIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft):const BackIntent(),
        },
        child: Actions(
            actions: <Type, Action<Intent>>{
              NextScreenIntent: CallbackAction(
                onInvoke: (intent) => Get.offAll(const SixthSlide()),
              ),
              BackIntent:CallbackAction(
                onInvoke: (intent) => Get.offAll(const FourthSlide()),
              )
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(alignment: Alignment.center,child: Text('Action', style: TextStyles.header),),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '=> An Action can be a simple callback like we add action on button Press to perform Some Operation on it',
                    style: TextStyles.content,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '=> Like We use Action on Button Press that same way when we declare action class then we have to mention intent , for which intent we can perform which action.',
                    style: TextStyles.content,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('=>Shortcuts are key bindings that activate by pressing a key or combination of keys. The key combinations reside in a table with their bound intent. When the Shortcuts widget invokes them, it sends their matching intent to the actions subsystem for fulfillment.',style: TextStyles.content,),
                  const SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Next Slide')),
                  ),
                  const Flexible(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.bottomCenter, child: Text("5",style: TextStyles.content)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
