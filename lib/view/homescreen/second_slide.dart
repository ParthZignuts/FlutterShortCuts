import 'package:get/get.dart';
import 'package:shortcuts/core/intent/intent.dart';
import '../../core/action/action.dart';
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

      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowRight):
              const NextScreenIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft): const BackIntent(),
        },
        child: Actions(
            dispatcher: LoggingActionDispatcher(),
            actions: <Type, Action<Intent>>{
              NextScreenIntent: NextScreenAction(onNextSlide: ()=>Get.offAll(const ThirdSlide())),
              BackIntent: BackSlideAction(onBackSlide: ()=>Get.offAll(const HomeScreen())),
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Align(
                    alignment: Alignment.center,
                    child: Text('ShortCuts', style: TextStyles.header),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Focus(
                    autofocus: true,
                    child: Text(
                      '=> As We All Know that Every time We  all are trying to find out shortcuts in our Life.',
                      style: TextStyles.content,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=> But Here we are not talking  about life shortcuts but We are looking for Shortcuts that help user , developer and other peoples to do things easily through some key press only.',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>Keyboard shortcuts are a way for users to quickly access features or  perform actions in an app by pressing one or more keys on the keyboard.',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>keyboard shortcuts can be defined using the Shortcuts widget, which takes a Map<LogicalKeySet, Intent> to map a set of keyboard keys to an action that should be triggered when the keys are pressed.',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>Shortcuts are key bindings that activate by pressing a key or combination of keys. ',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>The key combinations reside in a table with their bound intent. ',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>shortcuts:<LogicalKeySet,Intent>{LogicalKeySet(LogicalKeyboardKey.arrowRight): const NextScreenIntent(),}',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ), Text(
                    '',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("2", style: TextStyles.content)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
