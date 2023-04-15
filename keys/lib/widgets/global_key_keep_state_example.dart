import 'package:flutter/material.dart';

final key = GlobalKey();

class GlobalKeyKeepStateExample extends StatelessWidget {
  const GlobalKeyKeepStateExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Container(
                color: Colors.green[100],
                child: Foo(key: key),
              );
            case 1:
              return Container(
                color: Colors.blue[100],
                child: const Text('Blank Page'),
              );
            case 2:
              return Container(
                color: Colors.red[100],
                child: Foo(key: key),
              );
            default:
              throw '404';
          }
        },
      ),
    );
  }
}

class Foo extends StatefulWidget {
  const Foo({super.key});

  @override
  State<Foo> createState() => _FooState();
}

class _FooState extends State<Foo> {
  bool _switchValue = false;
  double _slideValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
            value: _switchValue,
            onChanged: (v) {
              setState(() {
                _switchValue = v;
              });
            }),
        Slider(
            value: _slideValue,
            onChanged: (v) {
              setState(() {
                _slideValue = v;
              });
            }),
      ],
    );
  }
}
