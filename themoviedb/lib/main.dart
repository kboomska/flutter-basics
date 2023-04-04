import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

import 'widgets/auth/auth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TMDB',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/auth': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
      },
      initialRoute: '/auth',
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute<void>(builder: (context) {
      //     return const Scaffold(
      //         body: Center(child: Text('Ой, что-то пошло не так...')));
      //   });
      // },
      // home: AuthWidget(), // Replaced by initialRoute
    );
  }
}

/*
class ExampleScreenWidget extends StatefulWidget {
  const ExampleScreenWidget({super.key});

  @override
  State<ExampleScreenWidget> createState() => _ExampleScreenWidgetState();
}

class _ExampleScreenWidgetState extends State<ExampleScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
          // if (Navigator.of(context).canPop()) {
          //   Navigator.of(context).pop();
          // }
        },
        child: Text('Press'),
      )),
    );
  }
}
*/