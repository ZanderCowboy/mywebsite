import 'package:flutter/material.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/views/home/home_page.dart';
import 'package:mywebsite/views/personal/personalpagecopy.dart';
// import 'package:mywebsite/views/personal/personal_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

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
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: kHomePageRoute,
      routes: {
        kHomePageRoute: (_) => const HomePage(),
        kPersonalPageRoute: (_) => const PersonalPage(),
      },
    );
  }
}
