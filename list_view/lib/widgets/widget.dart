import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        // addAutomaticKeepAlives: true,
        itemBuilder: (BuildContext context, int index) {
          return Ex(
            text: '$index',
          );
        },
      ),
    );
  }
}

// Example with AutomaticKeepAliveClientMixin
// return Container(
//       color: Colors.pink,
//       child: ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemCount: 100, // Required parameter!
//         // addAutomaticKeepAlives: true,
//         itemBuilder: (BuildContext context, int index) {
//           return Ex(
//             text: '$index',
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return Divider(
//             thickness: 2,
//             height: 0,
//             color: Colors.black,
//           );
//         },
//       ),
//     );

class Ex extends StatefulWidget {
  final String text;

  const Ex({super.key, required this.text});

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> with AutomaticKeepAliveClientMixin {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    print('1');
    return TextField(
      controller: controller,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class Ex extends StatefulWidget {
//   const Ex({super.key});

//   @override
//   State<Ex> createState() => _ExState();
// }

// class _ExState extends State<Ex> {
//   @override
//   void initState() {
//     super.initState();
//     print('2');
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('1');
//     return Center(
//       child: Container(
//         width: 50,
//         height: 50,
//         color: Colors.green,
//       ),
//     );
//   }
// }

// class Ex extends StatelessWidget {
//   const Ex({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('1');
//     return Container(
//       height: 50,
//       color: Colors.green,
//     );
//   }
// }

// Example with ListView.separated()
// return Container(
//       color: Colors.pink,
//       child: ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemCount: 10, // Required parameter!
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             color: index % 2 == 0 ? Colors.blue[200] : Colors.blue[100],
//             padding: const EdgeInsets.all(100.0),
//             child: Ex(),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           // return Container(
//           //   height: 10,
//           //   color: Colors.grey[300],
//           // );
//           return Divider(
//             thickness: 2,
//             height: 0,
//             color: Colors.black,
//           );
//         },
//       ),
//     );

// Example with ListView.builder()
// return Container(
//       color: Colors.pink,
//       child: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         // shrinkWrap: true,
//         itemCount: 5, // Optional parameter.
//         itemBuilder: (BuildContext context, int index) {
//         // print(index);
//         return Container(
//           color: index % 2 == 0 ? Colors.blue[200] : Colors.blue[100],
//           padding: const EdgeInsets.all(100.0),
//           // child: Text('$index'),
//           child: Ex(),
//         );
//       }),
//     );

// Example with ListView()
// return ListView(
//       children: [
//         Text('1'),
//         Text('2'),
//         Text('3'),
//         Text('4'),
//         Container(
//           height: 500,
//           color: Colors.black,
//         ),
//         Container(
//           height: 500,
//           color: Colors.red,
//         ),
//         Container(
//           height: 500,
//           color: Colors.blue,
//         ),
//         Container(
//           height: 500,
//           color: Colors.pink,
//         ),
//         Ex(),
//       ],
//     );
