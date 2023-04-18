import 'package:flutter/material.dart';

class InheritedWidgetExample extends StatelessWidget {
  const InheritedWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DataOwnerStatefull(),
      ),
    );
  }
}

class DataOwnerStatefull extends StatefulWidget {
  const DataOwnerStatefull({Key? key}) : super(key: key);

  @override
  State<DataOwnerStatefull> createState() => _DataOwnerStatefullState();
}

class _DataOwnerStatefullState extends State<DataOwnerStatefull> {
  var _value = 0;

  void _incriment() {
    _value += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _incriment,
          child: const Text('Press'),
        ),
        DataProviderInherited(
          value: _value,
          child: const DataConsumerStateless(),
        ),
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherited>()
            ?.value ??
        0;

    // final value =
    //     context.findAncestorStateOfType<_DataOwnerStatefullState>()?._value ??
    //         0;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$value'),
          const DataConsumerStatefull(),
        ],
      ),
    );
  }
}

class DataConsumerStatefull extends StatefulWidget {
  const DataConsumerStatefull({Key? key}) : super(key: key);

  @override
  State<DataConsumerStatefull> createState() => _DataConsumerStatefullState();
}

class _DataConsumerStatefullState extends State<DataConsumerStatefull> {
  @override
  Widget build(BuildContext context) {
    // Use findAncestorStateOfType() to get value (O(n)).
    // final value =
    //     context.findAncestorStateOfType<_DataOwnerStatefullState>()?._value ??
    //         0;

    // Use InheritedWidget's method to get value (O(1)).
    // final element = context
    //     .getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    // final dataProvider = element?.widget as DataProviderInherited;
    // final value = dataProvider.value;

    // Use own generic method to get value.
    // final value = getInherited<DataProviderInherited>(context)?.value ?? 0;

    // Use Use InheritedWidget's methods to get value.
    // final element = context
    //     .getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    // if (element != null) {
    //   context.dependOnInheritedElement(element);
    // }
    // final dataProvider = element?.widget as DataProviderInherited;
    // final value = dataProvider.value;

    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherited>()
            ?.value ??
        0;
    return Text('$value');
  }
}

class DataProviderInherited extends InheritedWidget {
  final int value;

  const DataProviderInherited({
    super.key,
    required this.value,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return value != oldWidget.value;
  }
}

T? getInherited<T>(BuildContext context) {
  final element =
      context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
  final widget = element?.widget;
  if (widget is T) {
    return widget as T;
  } else {
    return null;
  }
}
