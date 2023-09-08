import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/views/homepage.dart';
import 'package:mywebsite/views/personalpage.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 480, name: MOBILE),
          const Breakpoint(start: 481, end: 1000, name: TABLET),
          const Breakpoint(start: 1001, end: 1500, name: DESKTOP),
          const Breakpoint(start: 1501, end: double.infinity, name: '4K'),
        ],
      ),
      title: 'Zander Kotze Website',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: homePageRoute,
      routes: {
        homePageRoute: (context) => const HomePage(),
        personalPageRoute: (context) => const PersonalPage(),
      },
    );
  }
}
