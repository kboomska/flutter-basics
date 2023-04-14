import 'package:flutter/material.dart';

class StatelessWidgetExample extends StatelessWidget {
  const StatelessWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const RedBox();
  }
}

// class RedBox extends StatelessWidget {
//   RedBox() {
//     print('🏁 RedBox init');
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('🧱 RedBox build');
//     return Container(
//       color: Colors.red,
//       child: Padding(
//         padding: EdgeInsets.all(50),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Expanded(
//               child: Container(),
//             ),
//             Expanded(
//               child: BlueBox(),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Expanded(
//               child: GreenBox(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class RedBox extends StatefulWidget {
  const RedBox();

  @override
  State<RedBox> createState() => _RedBoxState();
}

class _RedBoxState extends State<RedBox> {
  var number = 0;

  _RedBoxState() {
    print('🏁 RedBox State init');
  }

  void _increment() {
    number += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('🧱 RedBox build');
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: _increment,
                  child: Text('$number'),
                ),
              ),
            ),
            const Expanded(
              child: BlueBox(),
            ),
            const SizedBox(
              height: 30,
            ),
            const Expanded(
              child: GreenBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox();

  @override
  Widget build(BuildContext context) {
    print('🧱 BlueBox build');
    return Container(
      color: Colors.blue,
    );
  }
}

class GreenBox extends StatelessWidget {
  const GreenBox();

  @override
  Widget build(BuildContext context) {
    print('🧱 GreenBox build');

    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: const [
                  TextField(),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: PinkBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class PinkBox extends StatelessWidget {
  const PinkBox();

  @override
  Widget build(BuildContext context) {
    print('🧱 PinkBox build');
    return Container(
      color: Colors.pink,
    );
  }
}
