
import '../intent/intent.dart';

class CopyTextAction extends Action<CopyTextIntent> {
  final TextEditingController controller;
  CopyTextAction(this.controller);

  @override
  Object? invoke(covariant CopyTextIntent intent) {
    final String selectedString = controller.text.substring(
      controller.selection.baseOffset,
      controller.selection.extentOffset,
    );
    Clipboard.setData(ClipboardData(text:selectedString));
    return null;
  }
}
