import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/components/link_button.dart';
import 'package:mywebsite/route/route.dart' as route;
import 'package:mywebsite/text_block.dart';
import 'package:mywebsite/widget_block.dart';
import 'package:mywebsite/views/secondpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/util/launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  final double SPACE_HEIGHT = 10.0;
  // final double SPACE_HEIGHT = 20.0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = _counter * 8000;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    //TODO: Add footer section using FOOTER

    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   // title: Center(child: Text(widget.title)),
      //
      // ),

      body: Container(

        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image1.jpeg"),

            // fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: [

            SizedBox(height: SPACE_HEIGHT + 100,),

            // Text_block('New Block', twitterColor),
            LinkButton(text: 'Personal Website', link: personalWebsiteURL, color: personalWebsiteColor),

            SizedBox(height: SPACE_HEIGHT,),

            // const Widget_block(Colors.purple, 'Here is your message', 'SecondPage()'),
            LinkButton(text: 'LinkedIn', link: linkedInURL, color: linkedInColor),

            SizedBox(height: SPACE_HEIGHT,),

            LinkButton(text: 'Twitter', link: twitterURL, color: twitterColor),

            SizedBox(height: SPACE_HEIGHT,),

            // LinkButton(text: 'Instagram', link: instagramURL, color: twitterColor),

            // Instagram
            DecoratedBox(decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFF405DE6),
                  Color(0xFF5851DB),
                  Color(0xFF833AB4),
                  Color(0xFFC13584),
                  Color(0xFFC13584),
                  Color(0xFFE1306C),
                  Color(0xFFFD1D1D),
                ],
              ),
              // image: DecorationImage(
              //     image:AssetImage("images/instagram/icons8-instagram-208.png"),
              //     // fit: BoxFit.cover
              //
              // ),
            ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  fixedSize: Size(350, 50),
                  onSurface: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),


                onPressed: () => LaunchURL(instagramURL),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("images/instagram/icons8-instagram-384.svg", width: 25,),
                    // Image(image: AssetImage("images/instagram/icons8-instagram-384.svg"),
                    //   height: 30,
                    // ),
                    SizedBox(width: 8,),
                    Text('Instagram', style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )
              // child: Text('Instagram', style: TextStyle(color: Colors.white),),
            ),


            SizedBox(height: SPACE_HEIGHT,),

            // GitHub
            // LinkButton(text: 'GitHub', link: githubURL, color: githubColor),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () => LaunchURL(githubURL),
                style: ElevatedButton.styleFrom(primary: githubColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('images/instagram/icons8-instagram-384.svg'),
                    // Image(image: AssetImage('images/instagram/icons8-instagram-384.svg'),
                    //   width: 22,
                    // ),
                    SizedBox(width: 8,),
                    Text('GitHub', style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            // LinkButton(text: 'GitHub', link: githubURL, color: githubColor, image: "images/instagram/icons8-instagram-384.svg",),

            SizedBox(height: SPACE_HEIGHT,),

            // Text_block(Colors.pinkAccent, 'Just work')
            LinkButton(text: 'YouTube', link: youtubeURL, color: youtubeColor),

          ],
        ),
      ),

      // body: Center(
      //
      //
      //   child: Column(
      //
      //     children: [
      //
      //       SizedBox(height: 25.0),
      //
      //       Text_block(
      //         Colors.pinkAccent,
      //         'First Block'
      //       ),
      //
      //       SizedBox(height: 25.0,),
      //
      //       Container(
      //         // color: Colors.blue,
      //         height: 200.0,
      //         width: 350.0,
      //         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
      //         decoration: BoxDecoration(color: Colors.lightBlueAccent ,borderRadius: BorderRadius.circular(10)),
      //
      //         child: Column(
      //           // Column is also a layout widget. It takes a list of children and
      //           // arranges them vrertically. By default, it sizes itself to fit its
      //           // children horizontally, and tries to be as tall as its parent.
      //           //
      //           // Invoke "debug painting" (press "p" in the console, choose the
      //           // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //           // to see the wireframe for each widget.
      //           //
      //           // Column has various properties to control how it sizes itself and
      //           // how it positions its children. Here we use mainAxisAlignment to
      //           // center the children vertically; the main axis here is the vertical
      //           // axis because Columns are vertical (the cross axis would be
      //           // horizontal).
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //
      //
      //
      //           children: <Widget>[
      //             const Text(
      //               'You have pushed the button this many times:',
      //             ),
      //             Text(
      //               '$_counter',
      //               style: Theme.of(context).textTheme.headline4,
      //             ),
      //           ],
      //
      //
      //         ),
      //       ),
      //
      //       SizedBox(height: 25.0),
      //
      //       Container(
      //         height: 200.0,
      //         width: 350.0,
      //         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
      //         decoration: BoxDecoration(color: Colors.grey ,borderRadius: BorderRadius.circular(10)),
      //
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //
      //           children: <Widget>[
      //             const Text(
      //                 'New Block'
      //             ),
      //
      //           ],
      //         ),
      //       ),
      //
      //       SizedBox(height: 25.0),
      //
      //       // Text_block(Colors.red, 'This is my first class')
      //     ],
      //   ),
      // ),


      floatingActionButton: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(

              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.book),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.


    );
  }
}

