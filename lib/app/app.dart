import 'package:flutter/material.dart';
import 'package:hamo_app/presentation/resources/routes_manager.dart';
import 'package:hamo_app/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key); // default constructor

  MyApp._internal(); // private named constructor
  static final MyApp instance = MyApp._internal(); // singeleton
  factory MyApp() => instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
