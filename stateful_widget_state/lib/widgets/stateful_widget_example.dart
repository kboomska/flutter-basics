import 'package:flutter/material.dart';

// final superKey = GlobalKey();

class StatefulWidgetExample extends StatelessWidget {
  const StatefulWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return RedBox();
  }
}

class RedBox extends StatefulWidget {
  RedBox() {
    print('🏁 RedBox init');
  }

  @override
  State<RedBox> createState() {
    print('RedBox createState');
    return _RedBoxState();
  }
}

class _RedBoxState extends State<RedBox> {
  var number = 0;

  _RedBoxState() {
    print('🏁 RedBox State init');
  }

  @override
  void initState() {
    super.initState();
    print('RedBox initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('RedBox didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant RedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('RedBox didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    // number = 10;
    // setState(() {});
    print('RedBox reassemble');
  }

  void _increment() {
    number += 1;
    setState(() {});
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
          body: StatefulWidgetExample(),
        ),
      ),
    );
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
            Expanded(
              // child: number % 2 == 0 ? GreenBox() : Container(),
              child: GreenBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    print('RedBox deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('RedBox dispose');
    super.dispose();
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

class GreenBox extends StatefulWidget {
  GreenBox({Key? key}) : super(key: key) {
    print('🏁 GreenBox init');
  }

  @override
  State<GreenBox> createState() {
    print('GreenBox createState');
    return _GreenBoxState();
  }
}

class _GreenBoxState extends State<GreenBox> {
  var _text = 'start';
  var isDeactivated = false;

  void _changeText(String text) {
    _text = text;
    setState(() {});
  }

  _GreenBoxState() {
    print('🧱 GreenBox State init');
  }

  @override
  void initState() {
    super.initState();

    final number = context.findAncestorStateOfType<_RedBoxState>()?.number;
    print(number);

    print('GreenBox initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final color = Theme.of(context).backgroundColor;

    print('GreenBox didChangeDependencies $color');
  }

  @override
  void didUpdateWidget(covariant GreenBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('GreenBox didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('GreenBox reassemble');
  }

  @override
  Widget build(BuildContext context) {
    print('🧱 GreenBox build');
    print('Is GreenBox deactivate: $isDeactivated');
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    onChanged: _changeText,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: PinkBox(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void deactivate() {
    isDeactivated = true;
    print('GreenBox deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('GreenBox dispose');
    super.dispose();
  }
}

class PinkBox extends StatelessWidget {
  PinkBox() {
    print('🏁 PinkBox init');
  }

  @override
  Widget build(BuildContext context) {
    print('🧱 PinkBox build');
    return Container(
      color: Colors.pink,
    );
  }
}
