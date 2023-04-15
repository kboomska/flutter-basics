import 'package:flutter/material.dart';

import 'widgets/reorderable_list_widget_example.dart';
import 'widgets/global_key_keep_state_example.dart';
import 'widgets/global_key_get_state_example.dart';
import 'widgets/page_storage_key_custom.dart';
import 'widgets/page_storage_key_scroll.dart';
import 'widgets/keys_example.dart';

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
        body: PageStorageKeyCustomExample(),
      ),
    );
  }
}
