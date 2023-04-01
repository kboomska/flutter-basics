import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    // Example 1
    //   return Container(
    //     width: 100,
    //     height: 100,
    //     color: Colors.red,
    //     child: Align(
    //       // alignment: Alignment.bottomCenter,
    //       child: Container(
    //         width: 100,
    //         height: 500,
    //         color: Colors.blue,
    //         child: Center(
    //           child: Container(
    //             width: double.infinity, // Constrained by blue Container.
    //             height: 100,
    //             color: Colors.green,
    //             child: MaterialApp(
    //               debugShowCheckedModeBanner: false,
    //               home: Scaffold(
    //                 body: Center(
    //                   child: Text(
    //                     'My width is infinite! But constrained by the parent widget..',
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    // Example 2
    // return Center(
    //   child: Container(
    //     padding: EdgeInsets.all(20), // inner offset.
    //     // Without his own parameters takes the size of his child.
    //     // width: 200,
    //     // height: 200,
    //     color: Colors.red,
    //     child: Container(
    //       // margin: EdgeInsets.all(20), // outer offset.
    //       width: 100,
    //       height: 100,
    //       color: Colors.blue,
    //     ),
    //   ),
    // );

    // Example 3
    // return Center(
    //   child: ConstrainedBox(
    //     constraints: BoxConstraints(
    //       minWidth: 70,
    //       minHeight: 70,
    //       maxWidth: 150,
    //       maxHeight: 150,
    //     ),
    //     child: Container(
    //       color: Colors.red,
    //       width: 10,
    //       height: 10,
    //     ),
    //   ),
    // );

    // Example 4
    // return UnconstrainedBox(
    //   // double.infinity is not working here.
    //   child: Container(
    //     color: Colors.red,
    //     width: 20,
    //     height: 50,
    //   ),
    // );

    // Example 5
    // return OverflowBox(
    //   // Allows its child to go beyond the screen without errors.
    //   minWidth: 0.0,
    //   minHeight: 0.0,
    //   maxWidth: double.infinity,
    //   maxHeight: double.infinity,
    //   child: Container(
    //     color: Colors.red,
    //     width: 4000,
    //     height: 50,
    //   ),
    // );

    // Example 6
    // return FittedBox(
    //   child: Text(
    //     // 'Some Example Text.',
    //     // 'Some Example Text. Some Example Text. Some Example Text.',
    //     'Some.',
    //     textDirection: TextDirection.ltr,
    //   ),
    // );

    // Example 7
    // return Center(
    //   child: FittedBox(
    //     child: Text(
    //       'Some Example Text.',
    //       // 'Some Example Text. Some Example Text. Some Example Text. Some Example Text.',
    //       textDirection: TextDirection.ltr,
    //     ),
    //   ),
    // );

    // Example 8
    // return Center(
    //   child: Text(
    //     'Some Example Text. Some Example Text. Some Example Text. Some Example Text.',
    //     textDirection: TextDirection.ltr,
    //   ),
    // );

    // Example 9
    // return FittedBox(
    //   child: Container(
    //     color: Colors.red,
    //     width: double.infinity, // Cause an Error.
    //     height: 20,
    //   ),
    // );

    // Example 10
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     body: Center(
    //       child: Row(
    //         textDirection: TextDirection.ltr,
    //         children: [
    //           Expanded(
    //             child: Container(
    //               color: Colors.red,
    //               child: Text(
    //                 // 'Hello!',
    //                 'As the Text() widget gets larger, the text will be moved to the next line.',
    //                 textDirection: TextDirection.ltr,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: Container(
    //               color: Colors.green,
    //               child: FittedBox(
    //                 child: Text(
    //                   // 'Goodbye!',
    //                   'This text is wrapped in Expanded, so when you increase Text() size, the font will decrease.',
    //                   textDirection: TextDirection.ltr,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    // Example 11
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     body: Center(
    //       child: Row(
    //         textDirection: TextDirection.ltr,
    //         children: [
    //           Expanded(
    //             flex: 1,
    //             child: Container(
    //               color: Colors.red,
    //               child: Text(
    //                 'Flex is 1',
    //                 textDirection: TextDirection.ltr,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: Container(
    //               color: Colors.blue,
    //               child: Text(
    //                 'Flex is 2',
    //                 textDirection: TextDirection.ltr,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             flex: 3,
    //             child: Container(
    //               color: Colors.green,
    //               child: Text(
    //                 'Flex is 3',
    //                 textDirection: TextDirection.ltr,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    // Example 12
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     body: Center(
    //       child: Row(
    //         textDirection: TextDirection.ltr,
    //         children: [
    //           Flexible(
    //             child: Container(
    //               color: Colors.red,
    //               child: Text(
    //                 'Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!',
    //                 textDirection: TextDirection.ltr,
    //               ),
    //             ),
    //           ),
    //           Flexible(
    //             // Similar to Expanded, but allows the child to take up less space than flex values.
    //             child: Container(
    //               color: Colors.green,
    //               child: Text(
    //                 'Goodbye!',
    //                 textDirection: TextDirection.ltr,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    // Example 13
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ConstrainedBox(
            // constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
            // constraints: BoxConstraints.tight(Size(100, 100)),
            constraints: BoxConstraints.loose(Size(300, 300)),
            child: Row(
              textDirection: TextDirection.ltr,
              children: [
                Flexible(
                  child: Container(
                    color: Colors.red,
                    child: Text(
                      'Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!',
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
                Flexible(
                  // Similar to Expanded, but allows the child to take up less space than flex values.
                  child: Container(
                    color: Colors.green,
                    child: Text(
                      'Goodbye!',
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
