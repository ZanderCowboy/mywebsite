import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footer/footer_view.dart';
import 'package:mywebsite/components/link_button.dart';
import 'package:mywebsite/route/route.dart' as route;
import 'package:mywebsite/text_block.dart';
import 'package:mywebsite/widget_block.dart';
import 'package:mywebsite/views/secondpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/util/launcher.dart';
import 'package:footer/footer.dart';

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
  final double SPACE_HEIGHT = 10.0;
  // final double SPACE_HEIGHT = 20.0;

  @override
  Widget build(BuildContext context) {
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
            Container(
              // height: 300,
              child: Column(
                children: [
                  SvgPicture.asset('images/cancel/icons8-cancel-384.svg',
                    height: 200.0,),
                  SizedBox(height: 4,),
                  Text('Zander Kotze',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text('Some description',
                    style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    ),
                  ),
                ],
              ),
              ),


            SizedBox(height: SPACE_HEIGHT + 50,),

            LinkButton(text: 'Personal Website', link: personalWebsiteURL, color: personalWebsiteColor),

            SizedBox(height: SPACE_HEIGHT,),

            LinkButton(text: 'LinkedIn', link: linkedInURL, color: linkedInColor, image: linkedInImage,),

            SizedBox(height: SPACE_HEIGHT,),

            LinkButton(text: 'Twitter', link: twitterURL, color: twitterColor, image: twitterImage,),

            SizedBox(height: SPACE_HEIGHT,),

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
            ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  fixedSize: const Size(320, 50),
                  onSurface: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () => LaunchURL(instagramURL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("images/instagram/icons8-instagram-384.svg", width: 25,),
                    SizedBox(width: 8,),
                    Text('Instagram', style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              )
            ),


            SizedBox(height: SPACE_HEIGHT,),

            // GitHub
            LinkButton(text: 'GitHub', link: githubURL, color: githubColor, image: githubImage,),

            SizedBox(height: SPACE_HEIGHT,),

            LinkButton(text: 'YouTube', link: youtubeURL, color: youtubeColor, image: youtubeImage,),

            // Container(
            //   height: 250,
            //   child: FooterView(
            //     children:<Widget>[
            //       new Padding(
            //         padding: EdgeInsets.only(top:200.0),
            //         child: Center(
            //           child: Text('Scrollable View'),
            //         ),
            //       ),
            //     ],
            //     footer: Footer(
            //       child: Text('I am a Customizable footer!!'),
            //       padding: EdgeInsets.all(10.0),
            //     ),
            //     flex: 1, //default flex is 2
            //   ),
            // ),

            // FooterView(
            //     children: <Widget>[
            //       new Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Padding(
            //             padding: EdgeInsets.only(top:50,left: 70),
            //             child: Text('Scrollable View Section'),
            //           )
            //         ],
            //       ),
            //     ],
            //     footer: Footer(
            //       child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children:<Widget>[
            //             Center(
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                 children: <Widget>[
            //                   SizedBox(
            //                       height: 45.0,
            //                       width: 45.0,
            //                       child: Center(
            //                         child:Card(
            //                           elevation: 5.0,
            //                           shape: RoundedRectangleBorder(
            //                             borderRadius: BorderRadius.circular(25.0), // half of height and width of Image
            //                           ),
            //                           child: IconButton(
            //                             icon: const Icon(Icons.audiotrack,size: 20.0,),
            //                             color: const Color(0xFF162A49),
            //                             onPressed: () {},
            //                           ),
            //                         ),
            //                       )
            //                   ),
            //                   Container(
            //                       height: 45.0,
            //                       width: 45.0,
            //                       child: Center(
            //                         child:Card(
            //                           elevation: 5.0,
            //                           shape: RoundedRectangleBorder(
            //                             borderRadius: BorderRadius.circular(25.0), // half of height and width of Image
            //                           ),
            //                           child: IconButton(
            //                             icon: const Icon(Icons.fingerprint,size: 20.0,),
            //                             color: const Color(0xFF162A49),
            //                             onPressed: () {},
            //                           ),
            //                         ),
            //                       )
            //                   ),
            //                   Container(
            //                       height: 45.0,
            //                       width: 45.0,
            //                       child: Center(
            //                         child:Card(
            //                           elevation: 5.0,
            //                           shape: RoundedRectangleBorder(
            //                             borderRadius: BorderRadius.circular(25.0), // half of height and width of Image
            //                           ),
            //                           child: IconButton(
            //                             icon: const Icon(Icons.call,size: 20.0,),
            //                             color: const Color(0xFF162A49),
            //                             onPressed: () {},
            //                           ),
            //                         ),
            //                       )
            //                   ),
            //                 ],
            //               ),
            //             ),
            //
            //             const Text('Copyright ©2020, All Rights Reserved.',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0, color: Color(0xFF162A49)),),
            //             const Text('Powered by Nexsport',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0,color: Color(0xFF162A49)),),
            //           ]
            //       ),
            //
            //     )
            // ),

            Expanded(child: Container()),

            Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              height: 50,
              width: double.infinity,
              child: Text(
                '2023 c Zander Kotze',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,

                ),

              ),
            )
          ],
        ),

      ),
    );
  }
}

