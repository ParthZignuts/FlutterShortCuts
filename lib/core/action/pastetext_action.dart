
import '../intent/intent.dart';
import '../intent/pastetext_intent.dart';

class PasteTextAction extends Action<PasteIntent>{
  TextEditingController controller;
  PasteTextAction(this.controller);
  @override
  Object? invoke(covariant PasteIntent intent) {
    Clipboard.getData(Clipboard.kTextPlain).then((value) {
      final String clipboardText = value?.text ?? '';
      final String newText = controller.text.replaceRange(
        controller.selection.baseOffset,
        controller.selection.extentOffset,
        clipboardText,
      );
      controller.value = controller.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(
          offset: controller.selection.baseOffset + clipboardText.length,
        ),
      );
    });
      return null;
  }

}