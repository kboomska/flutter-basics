import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  // final controller = ScrollController(initialScrollOffset: 1000);
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // controller.addListener(() {
    //   // print(controller.offset);
    //   print(controller.position);
    // });
    Future.delayed(Duration(seconds: 4)).then((_) {
      // controller.jumpTo(1000);
      controller.animateTo(
        1000,
        duration: Duration(seconds: 4),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];
    for (var i = 0; i <= 200; i++) {
      final widget = Text('$i');
      items.add(widget);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical, // Default is vertical.
      // reverse: true, // Dafault is false.
      // physics: NeverScrollableScrollPhysics(), // Scroll now doesn't work.
      // physics: BouncingScrollPhysics(), // Default for iOS.
      // physics: ClampingScrollPhysics(), // Default for Android.
      // dragStartBehavior: DragStartBehavior.down,
      controller: controller,
      child: Container(
        width: double.infinity,
        child: Column(
          children: items,
        ),
      ),
    );
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Container(
    //     height: double.infinity,
    //     child: Row(
    //       children: items,
    //     ),
    //   ),
    // );
  }
}
