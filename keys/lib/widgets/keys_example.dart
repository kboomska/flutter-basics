import 'dart:math';

import 'package:flutter/material.dart';

class KeyExample extends StatelessWidget {
  const KeyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: PositionedTiles(),
    );
  }
}

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({super.key});

  @override
  State<PositionedTiles> createState() => _PositionedTilesState();
}

class _PositionedTilesState extends State<PositionedTiles> {
  // List<Widget> tiles = [
  //   StatelessColorfulTile(),
  //   StatelessColorfulTile(),
  // ];

  // List<Widget> tiles = [
  //   StatefulColorfulTile(key: UniqueKey()),
  //   StatefulColorfulTile(key: UniqueKey()),
  // ];

  List<Widget> tiles = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulColorfulTile(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulColorfulTile(),
    ),
  ];

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: swapTiles,
          child: const Text('Toggle'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ],
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({super.key});

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  final myColor = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor,
    );
  }
}

class UniqueColorGenerator {
  static final _random = Random();
  static Color getColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1.0,
    );
  }
}

// class StatelessColorfulTile extends StatelessWidget {
//   StatelessColorfulTile({super.key});

//   final myColor = UniqueColorGenerator.getColor();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       color: myColor,
//     );
//   }
// }
