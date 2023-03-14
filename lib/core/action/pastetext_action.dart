import 'package:flutter/cupertino.dart';

import '../intent/pastetext_intent.dart';

class PasteTextAction extends Action<PasteIntent>{
  TextEditingController controller;
  PasteTextAction(this.controller);
  @override
  Object? invoke(covariant PasteIntent intent) {
      controller.text=controller.text.substring(
        controller.selection.baseOffset,
        controller.selection.extentOffset,
      );
      return null;
  }

}