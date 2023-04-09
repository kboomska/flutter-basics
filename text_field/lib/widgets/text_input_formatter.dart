import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputFormatterExample extends StatelessWidget {
  const TextInputFormatterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: TextField(
          inputFormatters: [
            // FilteringTextInputFormatter.digitsOnly,
            // FilteringTextInputFormatter.singleLineFormatter,
            // FilteringTextInputFormatter.allow(RegExp(r'[\d]+')),
            // FilteringTextInputFormatter.deny(
            //   RegExp(r'[\d]+'),
            //   replacementString: '-',
            // ),
            PhoneInputFormatter(),
          ],
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
      ),
    );
  }
}

// 123 456 78 90
class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');

    final initialSpecialSymbolCount = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]+'), '')
        .length;

    var cursorPosition = newValue.selection.start - initialSpecialSymbolCount;
    var finalCursorPosition = cursorPosition;

    final digitsOnlyChars = digitsOnly.split('');

    // if (oldValue.text.length - newValue.text.length == 1 &&
    if (oldValue.selection.textInside(oldValue.text) == ' ') {
      digitsOnlyChars.removeAt(cursorPosition - 1);
      finalCursorPosition -= 2;
    }

    var newString = <String>[];
    for (var i = 0; i < digitsOnlyChars.length; i++) {
      if (i == 3 || i == 6 || i == 8) {
        newString.add(' ');
        newString.add(digitsOnlyChars[i]);
        if (i <= cursorPosition) finalCursorPosition += 1;
      } else {
        newString.add(digitsOnlyChars[i]);
      }
    }

    final resultString = newString.join('');

    return TextEditingValue(
      text: resultString,
      selection: TextSelection.collapsed(offset: finalCursorPosition),
    );
  }
}
