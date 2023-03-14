import 'package:flutter/cupertino.dart';
import 'package:shortcuts/core/intent/alltext_intent.dart';

class AllTextAction extends Action<AllTextIntent>{
  final TextEditingController controller;
  AllTextAction(this.controller);
  @override
  Object? invoke(AllTextIntent intent) {
    controller.selection = controller.selection.copyWith(
      baseOffset: 0,
      extentOffset: controller.text.length,
      affinity: controller.selection.affinity,
    );
    return null;
  }

}