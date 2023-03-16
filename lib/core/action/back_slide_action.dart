
import '../intent/intent.dart';

class BackSlideAction extends Action<BackIntent>{

  final Function onBackSlide;
  BackSlideAction({required this.onBackSlide});
  @override
  Object? invoke(BackIntent intent) {

   return onBackSlide();
  }

}