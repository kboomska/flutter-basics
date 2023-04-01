import 'package:flutter/material.dart';

import 'widgets/widget.dart';

void main() {
  runApp(Example());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Example(),
      ),
    );
  }
}
