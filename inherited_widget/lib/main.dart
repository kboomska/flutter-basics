import 'package:flutter/material.dart';

// import 'widgets/inherited_pass_data_to_child_start.dart';
// import 'widgets/inherited_pass_data_to_child_finish.dart';
// import 'widgets/inherited_model_start.dart';
// import 'widgets/inherited_model_finish.dart';
// import 'widgets/inherited_communicate_widgets_start.dart';
// import 'widgets/inherited_communicate_widgets_finish.dart';
import 'widgets/inherited_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: InheritedWidgetExample(),
      // home: InheritedModelExample(),
      // home: InheritedCommunicateWidgetsExample(),
      home: InheritedNotifierExample(),
    );
  }
}
