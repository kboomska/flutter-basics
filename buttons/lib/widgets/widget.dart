import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String text = 'Ни одна кнопка не нажата';

  void printFirst() {
    print('first');
    setState(() {
      text = 'Нажата первая кнопка';
    });
  }

  void printSecond() {
    print('second');
    setState(() {
      text = 'Нажата вторая кнопка';
    });
  }

  void printLast() {
    print('last');
    setState(() {
      text = 'Нажата последняя кнопка';
    });
  }

  void onLongPress() {
    print('longpress');
    setState(() {
      text = 'Долгое нажатие';
    });
  }

  @override
  Widget build(BuildContext context) {
    final styleOfElevatedButtonOnly = ElevatedButton.styleFrom(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      // shadowColor: Colors.lightGreenAccent,
      // elevation: 10,
      padding: EdgeInsets.all(10),
      minimumSize: Size(140, 36),
      // maximumSize: Size(160, 36),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(60),
      //   side: BorderSide(color: Colors.black54),
      // ),
      // alignment: Alignment.centerRight,
      // visualDensity: VisualDensity(horizontal: 3, vertical: 2),
    );
    final style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      foregroundColor: MaterialStateProperty.all(Colors.pink),
      overlayColor: MaterialStateProperty.all(Colors.pink[200]),
      // shadowColor: MaterialStateProperty.all(Colors.lightGreenAccent),
      // elevation: MaterialStateProperty.all(10),
      // padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      minimumSize: MaterialStateProperty.all(Size(140, 36)),
      // shape: MaterialStateProperty.all(
      //   RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(19),
      //     side: BorderSide(color: Colors.green),
      //   ),
      // ),
      // alignment: Alignment.centerLeft,
      // visualDensity: VisualDensity(horizontal: 3, vertical: 2),
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          ElevatedButton(
            style: styleOfElevatedButtonOnly,
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(Colors.pink),
            //   foregroundColor: MaterialStateProperty.all(Colors.white),
            // ),
            // clipBehavior: Clip.hardEdge,
            onPressed: printFirst,
            onLongPress: onLongPress,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.radio_button_checked_outlined),
                SizedBox(
                  width: 10,
                ),
                Text('ElevatedButton'),
              ],
            ),
          ),
          OutlinedButton(
            style: style,
            onPressed: printSecond,
            onLongPress: onLongPress,
            child: Text('OutlinedButton'),
          ),
          TextButton(
            style: style,
            onPressed: () {
              print('TextButton pressed');
            },
            onLongPress: onLongPress,
            child: Text('TextButton'),
          ),
          IconButton(
            onPressed: printLast,
            icon: Icon(Icons.ac_unit),
            color: Colors.pink,
            iconSize: 40,
            splashRadius: 28,
            // padding: EdgeInsets.all(10),
            // alignment: Alignment.topCenter,
            splashColor: Colors.pinkAccent,
            // highlightColor: Colors.green,
            // hoverColor: Colors.amberAccent,
            disabledColor: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
