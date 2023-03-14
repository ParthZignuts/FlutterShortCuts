import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shortcuts/core/intent/copytext_intent.dart';

class CopyTextAction extends Action<CopyTextIntent> {

  CopyTextAction(this.controller);
  final TextEditingController controller;
  @override
  Object? invoke(covariant CopyTextIntent intent) {
    final String selectedString = controller.text.substring(
      controller.selection.baseOffset,
      controller.selection.extentOffset,
    );
    Clipboard.setData(ClipboardData(text: selectedString));
    return null;
  }
}
