import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: TextField(
          decoration: InputDecoration(
            // enabled: false,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            // border: UnderlineInputBorder(),
            // disabledBorder: UnderlineInputBorder(),

            // disabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5),
            //   borderSide: const BorderSide(
            //     color: Colors.grey,
            //     width: 1,
            //     // style: BorderStyle.solid,
            //   ),
            // ),

            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5),
            //   borderSide: const BorderSide(
            //     color: Colors.black,
            //     width: 2,
            //     // style: BorderStyle.solid,
            //   ),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: const BorderSide(
            //     color: Colors.blue,
            //     width: 2,
            //     // style: BorderStyle.solid,
            //   ),
            // ),

            // errorText: 'errorText',
            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: const BorderSide(
            //     color: Colors.red,
            //     width: 2,
            //     // style: BorderStyle.solid,
            //   ),
            // ),

            // focusedErrorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: const BorderSide(
            //     color: Colors.amber,
            //     width: 2,
            //     // style: BorderStyle.solid,
            //   ),
            // ),

            // icon: const Icon(Icons.ac_unit),

            // labelText: 'labelText',
            // labelStyle: const TextStyle(color: Colors.green),

            // helperText: 'helperText',
            // helperMaxLines: 1,
            // helperStyle: const TextStyle(color: Colors.purple),

            // hintText: 'hintText',
            // hintTextDirection: TextDirection.ltr,
            // hintMaxLines: 1,
            // hintStyle: const TextStyle(color: Colors.grey),

            // errorText: 'errorText',
            // errorMaxLines: 1,
            // errorStyle:  const TextStyle(color: Colors.pink),

            // prefixIcon: const Icon(Icons.access_alarm),
            // prefixIconConstraints: BoxConstraints.tight(const Size(10, 10)),
            // prefix: const Text('prefix'),
            // prefixText: 'prefix',
            // prefixStyle: const TextStyle(color: Colors.purple),

            // suffixIcon: const Icon(Icons.remove_red_eye),
            // suffixIconConstraints: BoxConstraints.tight(const Size(10, 10)),
            // suffix: const Text('prefix'),
            // suffixText: 'prefix',
            // suffixStyle: const TextStyle(color: Colors.purple),

            // floatingLabelBehavior: FloatingLabelBehavior.always,
            // isCollapsed: true,
            // isDense: true,
            // contentPadding: EdgeInsets.all(12.5),

            // counter: Text('counter'),
            // counterText: '3/10',
            // counterStyle: const TextStyle(color: Colors.grey),

            // filled: true,
            // fillColor: Colors.amber[100],

            // focusColor: Colors.blue,
            // hoverColor: Colors.green,

          ),
        ),
      ),
    );
  }
}
