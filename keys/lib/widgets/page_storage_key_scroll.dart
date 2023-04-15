import 'package:flutter/material.dart';

class PageStorageKeyScrollExample extends StatelessWidget {
  const PageStorageKeyScrollExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Container(
                color: Colors.green[100],
                child: const _Page(key: PageStorageKey(1)),
              );
            case 1:
              return Container(
                color: Colors.blue[100],
                child: const Text('Blank Page'),
              );
            case 2:
              return Container(
                color: Colors.red[100],
                child: const _Page(key: PageStorageKey(2)),
              );
            default:
              throw '404';
          }
        },
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('$index'),
        );
      },
    );
  }
}
