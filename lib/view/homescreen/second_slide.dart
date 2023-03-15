import 'package:get/get.dart';
import 'package:shortcuts/core/intent/intent.dart';
import '../homescreen/view.dart';


class SecondSlide extends StatefulWidget {
  const SecondSlide({Key? key}) : super(key: key);

  @override
  State<SecondSlide> createState() => _SecondSlideState();
}

class _SecondSlideState extends State<SecondSlide> {
  int count = 0;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shortcuts'),
        centerTitle: true,
      ),
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowRight): const NextScreenIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft):const BackIntent(),
        },
        child: Actions(
            actions: <Type, Action<Intent>>{
              NextScreenIntent: CallbackAction(
                onInvoke: (intent) => Get.offAll(const ThirdSlide()),
              ),
              BackIntent:CallbackAction(
                onInvoke: (intent) => Get.offAll(const HomeScreen()),
              )
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(alignment: Alignment.center,child: Text('ShortCuts', style: TextStyles.header),),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '=> Keyboard shortcuts are a way for users to quickly access features or  perform actions in an app by pressing one or more keys on the keyboard.',
                    style: TextStyles.content,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '=> keyboard shortcuts can be defined using the Shortcuts widget, which takes a Map<LogicalKeySet, Intent> to map a set of keyboard keys to an action that should be triggered when the keys are pressed.',
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
                        alignment: Alignment.bottomCenter, child: Text("2",style: TextStyles.content)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
