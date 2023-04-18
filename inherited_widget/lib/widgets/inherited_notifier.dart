import 'package:flutter/material.dart';

class InheritedNotifierExample extends StatelessWidget {
  const InheritedNotifierExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SimpleCalcWidget(),
      ),
    );
  }
}

class SimpleCalcWidget extends StatefulWidget {
  const SimpleCalcWidget({Key? key}) : super(key: key);

  @override
  State<SimpleCalcWidget> createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {
  final _model = SimpleCalcWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SimpleCalcWidgetProvider(
          model: _model,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FirstNumberWidget(),
              const SizedBox(height: 10),
              const SecondNumberWidget(),
              const SizedBox(height: 10),
              const CalculateButtonWidget(),
              const SizedBox(height: 10),
              const ResultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) =>
          SimpleCalcWidgetProvider.read(context)?.firstNumber = value,
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) =>
          SimpleCalcWidgetProvider.read(context)?.secondNumber = value,
    );
  }
}

class CalculateButtonWidget extends StatelessWidget {
  const CalculateButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => SimpleCalcWidgetProvider.read(context)?.sum(),
      child: const Text('Calculate the sum'),
    );
  }
}

// class ResultWidget extends StatefulWidget {
//   const ResultWidget({Key? key}) : super(key: key);

//   @override
//   State<ResultWidget> createState() => _ResultWidgetState();
// }

// class _ResultWidgetState extends State<ResultWidget> {
//   String _value = '-1';

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     final model = SimpleCalcWidgetProvider.of(context)?.model;
//     model?.addListener(() {
//       _value = '${model.calcResult}';
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text('Result: $_value');
//   }
// }

// InheritedNotifier allows to use the StatelessWidget again.
class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = SimpleCalcWidgetProvider.watch(context)?.calcResult ?? '-1';
    return Text('Result: $result');
  }
}

class SimpleCalcWidgetModel extends ChangeNotifier {
  int? _firstNumber;
  int? _secondNumber;
  int? calcResult;

  set firstNumber(String value) => _firstNumber = int.tryParse(value);
  set secondNumber(String value) => _secondNumber = int.tryParse(value);

  void sum() {
    int? calcResult;
    if (_firstNumber != null && _secondNumber != null) {
      calcResult = _firstNumber! + _secondNumber!;
    } else {
      calcResult = null;
    }
    if (this.calcResult != calcResult) {
      this.calcResult = calcResult;
      notifyListeners();
    }
  }
}

class SimpleCalcWidgetProvider
    extends InheritedNotifier<SimpleCalcWidgetModel> {
  final SimpleCalcWidgetModel model;

  const SimpleCalcWidgetProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          notifier: model,
          child: child,
        );

  static SimpleCalcWidgetModel? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.model;
  }

  static SimpleCalcWidgetModel? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.widget;
    return widget is SimpleCalcWidgetProvider ? widget.notifier : null;
  }

  // static SimpleCalcWidgetProvider? of(BuildContext context) {
  //   return context
  //       .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>();
  // }
}

// class ChangeNotifierProvider<T extends ChangeNotifier>
//     extends InheritedNotifier<T> {
//   final T model;

//   const ChangeNotifierProvider({
//     super.key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           notifier: model,
//           child: child,
//         );

//   static T? of<T>(BuildContext context) {
//     final provider =
//         context.dependOnInheritedWidgetOfExactType<ChangeNotifierProvider>();
//     if (provider != null) {
//       return provider.model as T;
//     } else {
//       return null;
//     }
//   }
// }
