import 'package:flutter/material.dart';

class ControlExample extends StatefulWidget {
  ControlExample({super.key});

  @override
  State<ControlExample> createState() => _ControlExampleState();
}

class _ControlExampleState extends State<ControlExample> {
  final controllerOne = TextEditingController(text: 'start text');
  final controllerTwo = TextEditingController(text: 'start string');
  final nodeOne = FocusNode();
  final nodeTwo = FocusNode();

  void _onChanged(String text) {
    print('_onChanged: $text');
  }

  void _onEditingComplete() {
    print('_onEditingComplete');
  }

  void _onSubmitted(String text) {
    print('_onSubmitted: $text');
    nodeOne.nextFocus();
  }

  void _onTap() {
    print('_onTap');
  }

  void _onListen() {
    controllerTwo.text = controllerOne.text.toUpperCase();
  }

  void _onButtonTap() {
    // controllerOne.clear();
    // controllerTwo.clear();

    // controllerOne.text = 'Some text was added';

    // controllerOne.addListener(_onListen);
    // controllerOne.removeListener(_onListen);

    // controllerOne.value = TextEditingValue(
    //   text: 'new text',
    //   // selection: TextSelection.collapsed(offset: 4),
    //   // selection: TextSelection.fromPosition(TextPosition(offset: 3)),
    //   selection: TextSelection(baseOffset: 2, extentOffset: 7),
    // );

    // print(nodeOne.hasFocus);
    // nodeOne.nextFocus();
    // nodeOne.unfocus();
    // nodeOne.requestFocus();
    // nodeOne.addListener(() {
    //   print(nodeTwo.hasFocus);
    // });
  }

  // void _onAppPrivateCommand(String text, Map<String, dynamic> arguments) {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              focusNode: nodeOne,
              controller: controllerOne,
              onChanged: _onChanged,
              onEditingComplete: _onEditingComplete,
              onSubmitted: _onSubmitted,
              onTap: _onTap,
              // onAppPrivateCommand: _onAppPrivateCommand,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              focusNode: nodeTwo,
              controller: controllerTwo,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: _onButtonTap,
              child: const Text('Press'),
            ),
          ],
        ),
      ),
    );
  }
}
