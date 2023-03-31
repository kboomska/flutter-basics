import 'package:flutter/material.dart';

class TwoString {
  final String text;
  final String text2;

  TwoString({required this.text, required this.text2});
}

class Example extends StatelessWidget {
  final List<TwoString> textData = [
    TwoString(text: 'Example 1', text2: 'Example a'),
    TwoString(text: 'Example 2', text2: 'Example b'),
    TwoString(text: 'Example 3', text2: 'Example c'),
    TwoString(text: 'Example 4', text2: 'Example d'),
    TwoString(text: 'Some string', text2: 'Что-нибудь'),
  ];

  Example({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> newTextData = textData
        .map((TwoString twoString) => TextWrapper(text: twoString))
        .toList();

    // List<Widget> textFields = [];
    // for (var text in newTextData) {
    //   final widget = TextWrapper(
    //     text: text,
    //   );

    //   textFields.add(widget);
    // }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: newTextData,
      ),
    );
  }
}

class TextWrapper extends StatelessWidget {
  final TwoString text;

  const TextWrapper({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text.text,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Spacer(),
        Text(
          text.text2,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
