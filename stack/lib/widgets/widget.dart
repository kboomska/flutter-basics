import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // fit: StackFit.loose, // Trying to fill as little space as possible.
        // fit: StackFit.expand, // Trying to fill as much space as possible.
        // fit: StackFit.passthrough, // Trying to follow the parent's restrictions.
        // alignment: AlignmentDirectional.center,
        // alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.red,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Text('Изменить'),
          ),
          // Container(
          //   width: 300,
          //   height: 300,
          //   padding: EdgeInsets.only(
          //     top: 10,
          //     right: 10,
          //   ),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: Text('Изменить'),
          //   ),
          // ),
          // Container(
          //   width: 200,
          //   height: 200,
          //   color: Colors.blue,
          // ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: Colors.green,
          // ),
          // Positioned(
          //   // Positioned ignores the size of the container.
          //   top: 10,
          //   left: 10,
          //   bottom: 10,
          //   right: 10,
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.green,
          //   ),
          // ),
        ],
      ),
    );
  }
}
