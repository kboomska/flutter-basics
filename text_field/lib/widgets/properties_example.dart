import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PropertiesExample extends StatelessWidget {
  const PropertiesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: TextField(
          // enabled: false,
          // readOnly: true,

          // keyboardAppearance: Brightness.light,
          // textInputAction: TextInputAction.done,
          // keyboardType: TextInputType.emailAddress,
          // keyboardType: TextInputType.phone,

          // showCursor: false,
          // cursorWidth: 3,
          // cursorHeight: 20,
          // cursorRadius: const Radius.circular(5),
          // cursorColor: Colors.black,

          // obscureText: true,
          // obscuringCharacter: '*',

          // autocorrect: false,
          // enableSuggestions: false,
          // textCapitalization: TextCapitalization.sentences,
          // smartDashesType: SmartDashesType.enabled,
          // smartQuotesType: SmartQuotesType.disabled,

          // enableInteractiveSelection: false,
          // toolbarOptions: ToolbarOptions(copy: true,selectAll: true, ),
          // selectionHeightStyle: ui.BoxHeightStyle.max,
          // selectionWidthStyle: ui.BoxWidthStyle.max,

          // selectionControls: TextSelectionControls(),
          // selectionControls: CupertinoTextSelectionControls(),
          // selectionControls: MaterialTextSelectionControls(),

          // style: TextStyle(fontSize: 30),
          // maxLines: 4,
          // minLines: 2,
          // expands: true,

          // maxLength: 10,
          // maxLengthEnforcement: MaxLengthEnforcement.none,
          
          // textAlign: TextAlign.center,
          // textAlign: TextAlign.start,
          // textDirection: TextDirection.rtl,
          // textAlignVertical: TextAlignVertical.center,

          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
