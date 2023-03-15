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
          actions: <Type, Action<Intent>>{
            NextScreenIntent: NextScreenAction(context),
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('ShortCuts'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hello Guys', style: TextStyles.header),
                const SizedBox(
                  height: 10,
                ),
                const Text('Today we will talk about ShortCuts In Flutter',
                    style: TextStyles.content),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Next")),
                const Flexible(
                  flex: 1,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("1", style: TextStyles.content)),
                ),
              ],
            ),
          ),
        ));
  }
}
