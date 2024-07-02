import 'package:flutter/material.dart';
import 'Pages/Login.dart';
import 'Pages/SignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/SignUp',
      routes: <String, WidgetBuilder>{
        '/': (context) => Login(),
        '/SignUp': (context) => SignUp(),
      },
    );
  }
}
