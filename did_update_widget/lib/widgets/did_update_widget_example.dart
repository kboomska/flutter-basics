import 'package:flutter/material.dart';

class DidUpdateWidgetExample extends StatefulWidget {
  const DidUpdateWidgetExample({super.key});

  @override
  State<DidUpdateWidgetExample> createState() => _DidUpdateWidgetExampleState();
}

class _DidUpdateWidgetExampleState extends State<DidUpdateWidgetExample> {
  var _isCollapse = false;

  void _toggle() {
    _isCollapse = !_isCollapse;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _toggle,
            child: Text(_isCollapse ? 'Развернуть' : 'Свернуть'),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.green,
                child: CollapseAnimatedBox(
                  duration: const Duration(milliseconds: 1000),
                  isCollapse: _isCollapse,
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CollapseAnimatedBox extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final bool isCollapse;

  const CollapseAnimatedBox({
    super.key,
    this.duration = const Duration(milliseconds: 250),
    required this.isCollapse,
    required this.child,
  });

  @override
  State<CollapseAnimatedBox> createState() => _CollapseAnimatedBoxState();
}

class _CollapseAnimatedBoxState extends State<CollapseAnimatedBox>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    if (!widget.isCollapse) {
      _animationController.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant CollapseAnimatedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCollapse == widget.isCollapse) return;

    if (widget.isCollapse) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
      axisAlignment: 0.0,
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: _animationController,
          curve: Curves.linear,
        ),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
