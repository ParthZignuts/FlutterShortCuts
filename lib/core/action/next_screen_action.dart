import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shortcuts/core/intent/next_screen_intent.dart';
import 'package:shortcuts/view/homescreen/second_slide.dart';

class NextScreenAction extends Action<NextScreenIntent> {
  final Function onNextSlide;


  NextScreenAction( {required this.onNextSlide});

  @override
  Object? invoke(NextScreenIntent intent) {
    Get.offAll(const SecondSlide());
    return onNextSlide();
  }
}
