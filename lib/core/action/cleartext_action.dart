import 'package:flutter/cupertino.dart';
import 'package:shortcuts/core/intent/cleartext_intent.dart';

class ClearTextAction extends Action<Intent> {
  final TextEditingController textEditingController;

  ClearTextAction(this.textEditingController);

  @override
  Object? invoke(covariant ClearTextIntent intent) {
    textEditingController.clear();
    return null;
  }
}
