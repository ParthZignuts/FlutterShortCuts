
import 'package:get/get.dart';
import 'package:shortcuts/core/action/action.dart';
import '../homescreen/view.dart';
import '../../core/intent/intent.dart';

class FourthSlide extends StatelessWidget {
  const FourthSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowRight):
          const NextScreenIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft):const BackIntent(),
        },
        child: Actions(
            dispatcher: LoggingActionDispatcher(),
            actions: <Type, Action<Intent>>{
              NextScreenIntent: NextScreenAction(onNextSlide: ()=> Get.offAll(const FifthSlide())),
              BackIntent:BackSlideAction(onBackSlide: ()=> Get.offAll(const ThirdSlide())),
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Align(alignment: Alignment.center,child: Text('Intent', style: TextStyles.header),),
                  SizedBox(
                    height: 10,
                  ),
                  Focus(
                    autofocus: true,
                    child: Text(
                      '=> An Intent as we know that Intent allow you to send messages from one component to another.',
                      style: TextStyles.content,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '=> In Shortcuts We Need combined Intent With Our Keyboard Keyset Like If I Press RightArrow Key then This Particular Intent Will Be Called.',
                    style: TextStyles.content,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('=> After that We Also Have to Combine Intent With Specific Action like Which Action Will Be Performed if We Press Particular Shortcuts. ',style: TextStyles.content,),
                  SizedBox(height: 10,),
                 Text('=>Mainy Intent Will be Helped to Trigger Specific Action on Shortcuts.',style:TextStyles.content),
                  SizedBox(height: 10,),
                  Flexible(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.bottomCenter, child: Text("4",style: TextStyles.content,)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
