import 'package:get/get.dart';
import '../../core/action/action.dart';
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
            BackIntent:BackSlideAction(onBackSlide: ()=>Get.offAll(const ShortcutDemoSlide())),
          },
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Focus(autofocus:true,child: Text('Thank You Guys', style: TextStyles.header)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('This is All About Shortcuts', style: TextStyles.content),

                  SizedBox(
                    height: 10,
                  ),
                  Text('I hope You All Are Understand if Any Question Please Let Me Know',
                      style: TextStyles.content),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const Text(
              "8",style: TextStyles.content,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
