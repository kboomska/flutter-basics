import 'package:flutter/material.dart';

import 'widgets/input_decoration_example.dart';
import 'widgets/properties_example.dart';
import 'widgets/control_example.dart';
import 'widgets/text_input_formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TextInputFormatterExample(),
      ),
    );
  }
}
