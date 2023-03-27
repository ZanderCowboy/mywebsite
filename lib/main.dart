import 'package:flutter/material.dart';
import 'package:mywebsite/views/homepage.dart';
import 'route/route.dart' as route;


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zander Kotze Website',
      theme: ThemeData(
        // primarySwatch: Color(0xFF748b97),
        primarySwatch: Colors.grey,
      ),

      onGenerateRoute: route.controller,
      initialRoute: route.homePage,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Zander Kotze'),

    );
  }
}



