import 'package:flutter/material.dart';
import 'package:flutter_tip_calculator/tip_calculator_app/tip_calculator_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TipCalculatorApp(),
    );
  }
}