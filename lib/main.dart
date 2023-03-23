import 'package:flutter/material.dart';
// import 'package:mywebsite/views/secondpage.dart';
import 'text_block.dart';
import 'route/route.dart' as route;

// void main() {
//   runApp(const MyApp());
// }

void main() {
  runApp(const MyApp());
}

// void main() {
//   runApp(const MaterialApp(
//     title: 'Navigation Basics',
//     home: FirstRoute(),
//   ));
// }


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zander Kotze Website',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),

      onGenerateRoute: route.controller,
      initialRoute: route.homePage,
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(title: 'Zander Kotze'),

    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 1;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter = _counter * 2;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Center(child: Text(widget.title)),
//
//       ),
//
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("images/image1.jpeg"),
//
//             // fit: BoxFit.cover,
//           ),
//         ),
//
//         child: Column(
//
//           children: [
//
//             // ElevatedButton(
//             //   child: const Text('Open route'),
//             //   onPressed: () {
//             //     // Navigate to second route when tapped.
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => const SecondRoute()),
//             //     );
//             //   },
//             // ),
//
//             const SizedBox(height: 25.0,),
//
//             Container(
//               // color: Colors.blue,
//               height: 200.0,
//               width: 350.0,
//               padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
//               decoration: BoxDecoration(color: Colors.lightBlueAccent ,borderRadius: BorderRadius.circular(10)),
//
//               child: Column(
//                 // Column is also a layout widget. It takes a list of children and
//                 // arranges them vrertically. By default, it sizes itself to fit its
//                 // children horizontally, and tries to be as tall as its parent.
//                 //
//                 // Invoke "debug painting" (press "p" in the console, choose the
//                 // "Toggle Debug Paint" action from the Flutter Inspector in Android
//                 // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//                 // to see the wireframe for each widget.
//                 //
//                 // Column has various properties to control how it sizes itself and
//                 // how it positions its children. Here we use mainAxisAlignment to
//                 // center the children vertically; the main axis here is the vertical
//                 // axis because Columns are vertical (the cross axis would be
//                 // horizontal).
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//
//
//
//                 children: <Widget>[
//                   const Text(
//                     'You have pushed the button this many times:',
//                   ),
//                   Text(
//                     '$_counter',
//                     style: Theme.of(context).textTheme.headline4,
//                   ),
//                 ],
//
//
//               ),
//             ),
//
//             const SizedBox(height: 25.0),
//
//             Container(
//               height: 200.0,
//               width: 350.0,
//               padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
//               decoration: BoxDecoration(color: Colors.grey ,borderRadius: BorderRadius.circular(10)),
//
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//
//                 children: <Widget>[
//                   const Text(
//                       'New Block'
//                   ),
//
//                   ElevatedButton(
//                     child: const Text('Open route'),
//                     onPressed: () {
//                       // Navigate to second route when tapped.
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SecondPage()),
//                       );
//                     },
//                   ),
//
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 25.0,),
//
//             Text_block(Colors.pinkAccent, 'Just work')
//
//           ],
//         ),
//       ),
//
//       // body: Center(
//       //
//       //
//       //   child: Column(
//       //
//       //     children: [
//       //
//       //       SizedBox(height: 25.0),
//       //
//       //       Text_block(
//       //         Colors.pinkAccent,
//       //         'First Block'
//       //       ),
//       //
//       //       SizedBox(height: 25.0,),
//       //
//       //       Container(
//       //         // color: Colors.blue,
//       //         height: 200.0,
//       //         width: 350.0,
//       //         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
//       //         decoration: BoxDecoration(color: Colors.lightBlueAccent ,borderRadius: BorderRadius.circular(10)),
//       //
//       //         child: Column(
//       //           // Column is also a layout widget. It takes a list of children and
//       //           // arranges them vrertically. By default, it sizes itself to fit its
//       //           // children horizontally, and tries to be as tall as its parent.
//       //           //
//       //           // Invoke "debug painting" (press "p" in the console, choose the
//       //           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//       //           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//       //           // to see the wireframe for each widget.
//       //           //
//       //           // Column has various properties to control how it sizes itself and
//       //           // how it positions its children. Here we use mainAxisAlignment to
//       //           // center the children vertically; the main axis here is the vertical
//       //           // axis because Columns are vertical (the cross axis would be
//       //           // horizontal).
//       //           mainAxisAlignment: MainAxisAlignment.center,
//       //           crossAxisAlignment: CrossAxisAlignment.center,
//       //
//       //
//       //
//       //           children: <Widget>[
//       //             const Text(
//       //               'You have pushed the button this many times:',
//       //             ),
//       //             Text(
//       //               '$_counter',
//       //               style: Theme.of(context).textTheme.headline4,
//       //             ),
//       //           ],
//       //
//       //
//       //         ),
//       //       ),
//       //
//       //       SizedBox(height: 25.0),
//       //
//       //       Container(
//       //         height: 200.0,
//       //         width: 350.0,
//       //         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
//       //         decoration: BoxDecoration(color: Colors.grey ,borderRadius: BorderRadius.circular(10)),
//       //
//       //         child: Column(
//       //           mainAxisAlignment: MainAxisAlignment.center,
//       //           crossAxisAlignment: CrossAxisAlignment.center,
//       //
//       //           children: <Widget>[
//       //             const Text(
//       //                 'New Block'
//       //             ),
//       //
//       //           ],
//       //         ),
//       //       ),
//       //
//       //       SizedBox(height: 25.0),
//       //
//       //       // Text_block(Colors.red, 'This is my first class')
//       //     ],
//       //   ),
//       // ),
//
//
//       floatingActionButton: Container(
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FloatingActionButton(
//
//               onPressed: _incrementCounter,
//               tooltip: 'Increment',
//               child: const Icon(Icons.book),
//             ),
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//
//
//     );
//   }
// }


