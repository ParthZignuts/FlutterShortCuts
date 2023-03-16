import '../intent/intent.dart';

class SetCounterAction extends Action<IncrementIntent>{
  final Function perform;

  SetCounterAction({required this.perform});

  @override
  Object? invoke(Intent intent) {
    debugPrint("Updated counter");
    return perform();
  }
}
