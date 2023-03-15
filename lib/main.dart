import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shortcuts/view/homescreen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shortcuts',
      theme: ThemeData.dark().copyWith(appBarTheme: const AppBarTheme(color: Colors.cyan,)),
      home: const HomeScreen(),
    );
  }
}