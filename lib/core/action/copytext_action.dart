import '../intent/intent.dart';

class CopyTextAction extends Action<CopyTextIntent> {
  final TextEditingController controller;

  CopyTextAction(this.controller);

  @override
  Object? invoke(covariant CopyTextIntent intent) {
    if (controller.selection.isValid && !controller.selection.isCollapsed) {
      final String selectedString = controller.text.substring(
        controller.selection.start,
        controller.selection.end,
      );
      Clipboard.setData(ClipboardData(text: selectedString));

    }
    return null;
  }
}
