import 'package:flutter/material.dart';

class ReorderableListWidgetExample extends StatefulWidget {
  const ReorderableListWidgetExample({super.key});

  @override
  State<ReorderableListWidgetExample> createState() =>
      _ReorderableListWidgetExampleState();
}

class _ReorderableListWidgetExampleState
    extends State<ReorderableListWidgetExample> {
  var ints = List<String>.generate(10, (index) => index.toString());

  void _onReorder(int from, int to) {
    setState(() {
      if (from < to) {
        to -= 1;
      }
      final element = ints.removeAt(from);
      ints.insert(to, element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: ints.length,
      itemBuilder: (context, index) {
        return GreenBox(
          key: ValueKey(ints[index]),
        );
      },
      onReorder: _onReorder,
    );
  }
}

class GreenBox extends StatefulWidget {
  GreenBox({super.key}) {
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
  var isDisposed = false;

  void _changeText(String text) {
    _text = text;
    setState(() {});
  }

  _GreenBoxState() {
    print('🧱 GreenBox state init');
  }

  @override
  void initState() {
    super.initState();
    print('FreenBox initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('GreenBox didChangeDependencies');
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
    print('GreenBox IsDeactivated: $isDeactivated, isDisposed: $isDisposed');
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.green,
        child: Column(
          children: [
            Text(_text),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: _changeText,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
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
