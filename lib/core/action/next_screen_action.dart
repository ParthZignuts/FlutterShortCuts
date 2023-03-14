import 'package:flutter/material.dart';
import 'package:shortcuts/core/intent/next_screen_intent.dart';
import 'package:shortcuts/view/homescreen/second_screen.dart';

class NextScreenAction extends Action<NextScreenIntent>{
  BuildContext context;
  NextScreenAction(this.context);

  @override
  Object? invoke(NextScreenIntent intent) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen(),));
  return null;
  }

}