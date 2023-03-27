import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/components/copyright/copyright.dart';
import 'package:mywebsite/components/link_button.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/util/launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double SPACE_HEIGHT = 10.0;
  static const IconData copyright =
      IconData(0xe198, fontFamily: 'MaterialIcons');

  // final double SPACE_HEIGHT = 20.0;

  @override
  Widget build(BuildContext context) {
    double PAGE_HEIGHT = MediaQuery.of(context).size.height;
    debugPrint(PAGE_HEIGHT.toString());

    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   // title: Center(child: Text(widget.title)),
      //
      // ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              // Container(

              // width: double.infinity,
              // height: double.infinity,
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,

              decoration: const BoxDecoration(
                // color: Colors.transparent,
                image: DecorationImage(
                  // image: AssetImage("images/image1.jpeg"),
                  // image: AssetImage("images/mountain.jpg"),

                  // Network: https://www.pexels.com/photo/lake-and-mountain-417074/
                  image: NetworkImage(
                      'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?cs=srgb&dl=pexels-james-wheeler-417074.jpg&fm=jpg&w=4226&h=2847&_gl=1*1u9l7f3*_ga*MTAyNDYxOTY2Mi4xNjc5NzA0NDQx*_ga_8JE65Q40S6*MTY3OTg3MDIwNS40LjEuMTY3OTg3MDIwNS4wLjAuMA..'),
                  // image: AssetImage("images/mountain.webp"),
                  // image: SvgPicture.asset(pictureProvider),
                  fit: BoxFit.fill,
                  scale: 2,
                  alignment: Alignment.center,

                  // scale: 3,
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // height: 300,
                    child: Column(
                      children: [
                        Image.asset(
                          'images/profile2.png',
                          height: 250,
                        ),
                        // SvgPicture.asset(
                        //   'images/profile.png',
                        //   height: 200.0,
                        // ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'ZANDER KOTZE',
                          style: TextStyle(
                            // fontFamily: 'PlayfairDisplay',
                            fontFamily: 'Anton',
                            fontSize: 55,
                            // fontWeight: FontWeight,
                            // color: Colors.blueGrey.shade800,
                            // color: Color(0xFF32D4FB),
                            color: Colors.white,
                            letterSpacing: 1.5,
                            wordSpacing: 6.0,
                          ),
                        ),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          child: const Divider(
                            color: Colors.white,
                            // height: 25,

                            thickness: 4,
                            indent: 5,
                            endIndent: 5,
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       'Z',
                        //       style: TextStyle(
                        //         fontFamily: 'PlayfairDisplay',
                        //         fontSize: 55,
                        //         fontWeight: FontWeight.w900,
                        //         // color: Colors.blueGrey.shade800,
                        //         // color: Color(0xFF32D4FB),
                        //         color: Colors.red,
                        //       ),
                        //     ),
                        //     Text(
                        //       'A',
                        //       style: TextStyle(
                        //         fontFamily: 'PlayfairDisplay',
                        //         fontSize: 55,
                        //         fontWeight: FontWeight.w900,
                        //         // color: Colors.blueGrey.shade800,
                        //         // color: Color(0xFF32D4FB),
                        //         color: Colors.orange,
                        //       ),
                        //     ),
                        //     Text(
                        //       'N',
                        //       style: TextStyle(
                        //         fontFamily: 'PlayfairDisplay',
                        //         fontSize: 55,
                        //         fontWeight: FontWeight.w900,
                        //         // color: Colors.blueGrey.shade800,
                        //         // color: Color(0xFF32D4FB),
                        //         color: Colors.yellow,
                        //       ),
                        //     ),
                        //     Text(
                        //       'D',
                        //       style: TextStyle(
                        //         fontFamily: 'PlayfairDisplay',
                        //         fontSize: 55,
                        //         fontWeight: FontWeight.w900,
                        //         // color: Colors.blueGrey.shade800,
                        //         // color: Color(0xFF32D4FB),
                        //         color: Colors.green,
                        //       ),
                        //     ),
                        //     Text(
                        //       'E',
                        //       style: TextStyle(
                        //         fontFamily: 'PlayfairDisplay',
                        //         fontSize: 55,
                        //         fontWeight: FontWeight.w900,
                        //         // color: Colors.blueGrey.shade800,
                        //         // color: Color(0xFF32D4FB),
                        //         color: Colors.blue,
                        //       ),
                        //     ),
                        //     Text(
                        //       'R',
                        //       style: TextStyle(
                        //         fontFamily: 'PlayfairDisplay',
                        //         fontSize: 55,
                        //         fontWeight: FontWeight.w900,
                        //         // color: Colors.blueGrey.shade800,
                        //         // color: Color(0xFF32D4FB),
                        //         color: Colors.purpleAccent,
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          child: Wrap(
                            children: [
                              Center(
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Oh! Hi there! Here are a few of my links.',
                                      textStyle: TextStyle(
                                        fontFamily: 'PoiretOne',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.grey,
                                        // color: Color(0xFF32D4FB),
                                        // color: Color(0xEE254B70), // Darkish blue-gray
                                        // color: Color(0xAA8B5B31),
                                        color: Colors.white,
                                        // backgroundColor: Colors.white24,
                                        // backgroundColor: Colors.transparent.withAlpha(55),
                                        wordSpacing: 1.5,
                                        letterSpacing: 1.0,
                                      ),
                                      speed: const Duration(milliseconds: 90),
                                    ),
                                  ],
                                  // isRepeatingAnimation: false,
                                  pause: Duration(seconds: 5),
                                  totalRepeatCount: 2,
                                ),
                              ),
                              // Center(
                              //   child: Text(
                              //     "Oh! Hi there! Here are a few of my links.",
                              //     style: TextStyle(
                              //       fontFamily: 'PoiretOne',
                              //       fontSize: 18,
                              //       fontWeight: FontWeight.bold,
                              //       // color: Colors.grey,
                              //       // color: Color(0xFF32D4FB),
                              //       // color: Color(0xEE254B70), // Darkish blue-gray
                              //       // color: Color(0xAA8B5B31),
                              //       color: Colors.white,
                              //       // backgroundColor: Colors.white24,
                              //       // backgroundColor: Colors.transparent.withAlpha(55),
                              //       wordSpacing: 1.5,
                              //       letterSpacing: 1.0,
                              //
                              //     ),
                              //     maxLines: 5,
                              //   ),
                              // ),
                            ],
                            // child:
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                          width: 320,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                          Colors.transparent.withOpacity(0.1).withAlpha(1100),
                      // color: Color(0xAA748B97),
                      // color: Color(0xAAFFFFFF),
                      // color: Colors.transparent,
                      border: Border.all(
                          color: const Color(0x44748B97),
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        // SizedBox(height: SPACE_HEIGHT + 50, width: 320.0,),

                        LinkButton(
                          text: 'Personal Website',
                          link: personalWebsiteURL,
                          color: personalWebsiteColor,
                          image: personalWebsiteImage,
                        ),

                        SizedBox(
                          height: SPACE_HEIGHT,
                          width: 320.0,
                        ),

                        LinkButton(
                          text: 'LinkedIn',
                          link: linkedInURL,
                          color: linkedInColor,
                          image: linkedInImage,
                        ),

                        SizedBox(
                          height: SPACE_HEIGHT,
                          width: 320.0,
                        ),

                        LinkButton(
                          text: 'Twitter',
                          link: twitterURL,
                          color: twitterColor,
                          image: twitterImage,
                        ),

                        SizedBox(
                          height: SPACE_HEIGHT,
                          width: 320.0,
                        ),

                        // Instagram
                        Container(
                          child: DecoratedBox(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color(0xFFFFD600),
                                    Color(0xFFFF7A00),
                                    Color(0xFFFF0069),
                                    Color(0xFFD300C5),
                                    Color(0xFF7638FA),
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
                                    SvgPicture.asset(
                                      "images/instagram/icons8-instagram-384.svg",
                                      width: 25,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Instagram',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              )),
                        ),

                        SizedBox(
                          height: SPACE_HEIGHT,
                          width: 320.0,
                        ),

                        // GitHub
                        LinkButton(
                          text: 'GitHub',
                          link: githubURL,
                          color: githubColor,
                          image: githubImage,
                        ),

                        SizedBox(
                          height: SPACE_HEIGHT,
                          width: 320.0,
                        ),

                        // YouTube
                        LinkButton(
                          text: 'YouTube',
                          link: youtubeURL,
                          color: youtubeColor,
                          image: youtubeImage,
                        ),

                        SizedBox(
                          height: SPACE_HEIGHT,
                          width: 320.0,
                        ),

                        // Discord
                        LinkButton(
                          text: 'Discord',
                          link: discordURL,
                          color: discordColor,
                          image: discordImage,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        flex: 2,
                        child: Container(
                            //   child: Text('Test'),
                            ),
                      ),
                      Container(
                        // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        alignment: Alignment.bottomCenter,
                        color: Colors.transparent,
                        // height: 80,
                        height: 0.1 * MediaQuery.of(context).size.height,
                        // 120,
                        width: MediaQuery.of(context).size.width,

                        child: const Copyright(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      // TEST FLEX CLASS

      // body: SingleChildScrollView(
      //   child: Flex(
      //     mainAxisSize: MainAxisSize.max,
      //     direction: Axis.vertical,
      //     children: [
      //
      //     Container( // Image Container
      //
      //       // Container(
      //
      //       // width: double.infinity,
      //       // height: double.infinity,
      //       // height: MediaQuery.of(context).size.height,
      //
      //
      //       decoration: const BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage("images/mountain.jpg"),
      //           fit: BoxFit.fill,
      //         ),
      //       ),
      //
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         mainAxisSize: MainAxisSize.max,
      //         children: [
      //
      //           Column( // Copyright Section Column
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Container(
      //                 // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      //                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      //                 alignment: Alignment.bottomCenter,
      //                 color: Colors.transparent,
      //                 height: 80, // 120,
      //                 width: MediaQuery.of(context).size.width,
      //
      //                 child: const Copyright(),
      //
      //
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     ],
      //   ),
      // ),
    );
  }
}
