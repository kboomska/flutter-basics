import 'package:flutter/material.dart';

class ExampleCustomSingleChildLayout extends StatelessWidget {
  const ExampleCustomSingleChildLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: CustomSingleChildLayout(
          delegate: OwnSingleChildLayoutDelegate(),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class OwnSingleChildLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  Size getSize(BoxConstraints constraints) {
    // return constraints.biggest;
    // return Size(300, 100);
    // return Size(constraints.biggest.width, constraints.biggest.width);
    return Size(constraints.biggest.width, 100);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // return constraints;
    // return BoxConstraints.tight(constraints.biggest);
    return BoxConstraints.tight(Size(100, 50));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // return Offset.zero;
    // return Offset(150, 200);
    // return Offset(childSize.width, 0);
    final yOffset = size.height / 2 - childSize.height / 2;
    return Offset(childSize.width, yOffset);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
