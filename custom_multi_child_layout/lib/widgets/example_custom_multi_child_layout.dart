import 'package:flutter/material.dart';

class ExampleCustomMultiChildLayout extends StatelessWidget {
  const ExampleCustomMultiChildLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: CustomMultiChildLayout(
          delegate: OwnMultiChildLayoutDelegate(),
          children: [
            LayoutId(
              id: 1,
              child: Text(
                'left',
                textDirection: TextDirection.ltr,
              ),
            ),
            LayoutId(
              id: 2,
              child: Text(
                'center',
                textDirection: TextDirection.ltr,
              ),
            ),
            LayoutId(
              id: 3,
              child: Text(
                'right',
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OwnMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  Size getSize(BoxConstraints constraints) =>
      Size(constraints.biggest.width, 100);

  @override
  void performLayout(Size size) {
    if (hasChild(1) && hasChild(2) && hasChild(3)) {
      final minOtherElementWidth = 50;

      final firstElementMaxWidth = size.width - 2 * minOtherElementWidth;
      final firstElementSize = layoutChild(
        1,
        BoxConstraints.loose(
          Size(
            firstElementMaxWidth,
            size.height,
          ),
        ),
      );

      final thirdElementMaxWidth =
          size.width - firstElementSize.width - minOtherElementWidth;
      final thirdElementSize = layoutChild(
        3,
        BoxConstraints.loose(
          Size(
            thirdElementMaxWidth,
            size.height,
          ),
        ),
      );

      final secondElementMaxWidth =
          size.width - firstElementSize.width - thirdElementSize.width;
      final secondElementSize = layoutChild(
        2,
        BoxConstraints.loose(
          Size(
            secondElementMaxWidth,
            size.height,
          ),
        ),
      );

      final firstElementYOffset = size.height / 2 - firstElementSize.height / 2;
      positionChild(1, Offset(0, firstElementYOffset));

      final thirdElementXOffset = size.width - thirdElementSize.width;
      final thirdElementYOffset = size.height / 2 - thirdElementSize.height / 2;
      positionChild(3, Offset(thirdElementXOffset, thirdElementYOffset));

      var secondElementXOffset = size.width / 2 - secondElementSize.width / 2;
      if (firstElementSize.width > secondElementXOffset) {
        secondElementXOffset = firstElementSize.width;
      } else if (thirdElementXOffset < secondElementXOffset + secondElementSize.width) {
        secondElementXOffset = thirdElementXOffset - secondElementSize.width;
      }

      final secondElementYOffset =
          size.height / 2 - secondElementSize.height / 2;
      positionChild(2, Offset(secondElementXOffset, secondElementYOffset));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

// Option with Row
// Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(child: Text('1')),
//             Expanded(child: Center(child: Text('22222222222222222222222'))),
//             Expanded(
//                 child:
//                     Align(alignment: Alignment.centerRight, child: Text('3'))),
//           ],
//         ),

// Option with Stack
// Stack(
//             fit: StackFit.expand,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Text('11111111'),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text('22222222222222222222222'),
//               ),
//             ],
//           ),

/*
Container(
        color: Colors.blue,
        child: CustomMultiChildLayout(
          delegate: OwnMultiChildLayoutDelegate(),
          children: [
            LayoutId(
              id: 1,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.pink,
              ),
            ),
            LayoutId(
              id: 2,
              child: Container(
                color: Colors.red,
              ),
            ),
            LayoutId(
              id: 3,
              child: Text(
                'data',
                textDirection: TextDirection.ltr,
              ),
            ),
          ],
        ),
      ),

class OwnMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  Size getSize(BoxConstraints constraints) =>
      Size(constraints.biggest.width, 100);

  @override
  void performLayout(Size size) {
    // final a = hasChild(1); // true
    // final b = hasChild(2); // true
    // final c = hasChild(3); // true
    // final d = hasChild(4); // false

    if (hasChild(1) && hasChild(2) && hasChild(3)) {
      layoutChild(1, BoxConstraints.loose(size));
      layoutChild(2, BoxConstraints.tight(Size(50, size.height)));
      layoutChild(3, BoxConstraints.loose(size));

      positionChild(1, Offset(0, 50));
      positionChild(2, Offset(100, -50));
      positionChild(3, Offset(300, 0));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
*/
