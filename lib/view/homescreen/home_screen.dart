import 'package:get/get.dart';
import '../../core/action/action.dart';
import '../../core/intent/intent.dart';
import '../homescreen/view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowRight):
              const NextScreenIntent(),
        },
        child: Actions(
          dispatcher: LoggingActionDispatcher(),
          actions: <Type, Action<Intent>>{
            NextScreenIntent: NextScreenAction(onNextSlide: ()=>Get.offAll(const SecondSlide())),
          },
          child: Scaffold(

            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Flutter Shortcuts', style: TextStyles.header),
                  SizedBox(
                    height: 10,
                  ),
                  Focus(
                    autofocus: true,
                    child: Text('Prepared By: Parth Akbari',
                        style: TextStyles.content),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const Text(
              "1",style: TextStyles.content,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
