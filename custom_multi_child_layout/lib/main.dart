import 'package:flutter/material.dart';

// import 'widgets/example_custom_single_child_layout.dart';
import 'widgets/example_custom_multi_child_layout.dart';

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
        body: ExampleCustomMultiChildLayout(),
      ),
    );
  }
}
