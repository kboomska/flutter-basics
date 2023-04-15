import 'package:flutter/material.dart';

final key = GlobalKey<_AwesomeTextState>();

class GlobalKeyGetStateExample extends StatelessWidget {
  const GlobalKeyGetStateExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => key.currentState?._increment(),
            child: const Text('Увеличить'),
          ),
          AwesomeText(key: key),
        ],
      ),
    );
  }
}

class AwesomeText extends StatefulWidget {
  const AwesomeText({super.key});

  @override
  State<AwesomeText> createState() => _AwesomeTextState();
}

class _AwesomeTextState extends State<AwesomeText> {
  var _value = 0;
  
  void _increment() {
    _value += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_value');
  }
}
