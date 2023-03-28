import 'package:flutter/material.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/views/firstpage.dart';
import 'package:mywebsite/views/homepage.dart';
import 'package:mywebsite/views/secondpage.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(child,
          // maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            // const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ]),
      title: 'Zander Kotze Website',
      theme: ThemeData(
        // primarySwatch: Color(0xFF748b97),
        primarySwatch: Colors.grey,
      ),

      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      initialRoute: homePageRoute,
      routes: {
        firstPageRoute: (context) => const FirstPage(),
        secondPageRoute: (context) => const SecondPage(),
      },
    );
  }
}
