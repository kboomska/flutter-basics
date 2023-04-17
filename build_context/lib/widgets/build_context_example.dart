import 'package:flutter/material.dart';

final key = GlobalKey<_ColoredWidgetState>();

class BuildContextExample extends StatelessWidget {
  const BuildContextExample({super.key});

  static void nextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const NextScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ElevatedButton(
          onPressed: () => nextScreen(context),
          child: const Text('Next Screen'),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InheritExample(
          child: ColoredWidget(
            initialColor: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: ColoredWidget(
                key: key,
                initialColor: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.all(40),
                  child: ColorButton(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InheritExample extends InheritedWidget {
  const InheritExample({
    super.key,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class ColoredWidget extends StatefulWidget {
  final Color initialColor;
  final Widget child;

  const ColoredWidget({
    super.key,
    required this.initialColor,
    required this.child,
  });

  @override
  State<ColoredWidget> createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.initialColor;
  }

  void changeColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: widget.child,
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({super.key});

  // void _onPressed(BuildContext context) {
  //   context
  //       .findAncestorStateOfType<_ColoredWidgetState>()
  //       ?.changeColor(Colors.pink);
  //   context
  //       .findRootAncestorStateOfType<_ColoredWidgetState>()
  //       ?.changeColor(Colors.yellow);
  //   key.currentState?.changeColor(Colors.purple);
  // }

  @override
  Widget build(BuildContext context) {
    return const ColoredWidget(
      initialColor: Colors.blue,
      child: Center(
        child: ButtonExample(),
        // child: Builder(
        //   // It's not a good practice to use Builder.
        //   builder: (BuildContext context) {
        //     return ElevatedButton(
        //       onPressed: () => _onPressed(context),
        //       child: const Text('Press'),
        //     );
        //   },
        // ),
      ),
    );
  }
}

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  void _onPressed(BuildContext context) {
    context
        .findAncestorStateOfType<_ColoredWidgetState>()
        ?.changeColor(Colors.pink);
    context
        .findRootAncestorStateOfType<_ColoredWidgetState>()
        ?.changeColor(Colors.yellow);
    key.currentState?.changeColor(Colors.purple);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _onPressed(context),
      child: const Text('Press'),
    );
  }
}
