import 'package:get/get.dart';
import 'package:shortcuts/core/action/action.dart';
import '../homescreen/view.dart';
import '../../core/intent/intent.dart';

class FifthSlide extends StatelessWidget {
  const FifthSlide({Key? key}) : super(key: key);

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
              NextScreenIntent: NextScreenAction(
                  onNextSlide: () => Get.offAll(const SixthSlide())),
              BackIntent: BackSlideAction(
                  onBackSlide: () => Get.offAll(const FourthSlide())),
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Align(
                    alignment: Alignment.center,
                    child: Text('Action', style: TextStyles.header),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Focus(
                    autofocus: true,
                    child: Text(
                      '=> Actions is an StatefulWidget that provided in flutter widget library itself, so we have to directly used it.',
                      style: TextStyles.content,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>Actions widget is wrapped under Shortcuts widget .',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>Actions Widget can take  four Properties but we have to use three property from them for implementation of the Shotcuts.',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>1.dispatcher : It take ActionDispatcher which will be used maily for the printing logs like what action will be called . ActionDispatcher will be used because after some time we don’t know which action will be used for which shortcuts.',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>2.actions:<Type, Action<Intent>>{ NextScreenIntent: const NextScreenIntent(),}',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=>3.child: it takes widget we have to show as a Ui to the user.',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("5", style: TextStyles.content)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
