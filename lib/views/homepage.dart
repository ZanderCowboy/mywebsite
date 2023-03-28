import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/components/copyright/copyright.dart';
import 'package:mywebsite/components/link_button.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/util/launcher.dart';

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key, required this.title}) : super(key: key);
  // final String title;

  final double buttonSpaceHeight = 10.0;
  final double buttonSpaceWidth = 320.0;

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    double pageWidth = MediaQuery.of(context).size.width;
    debugPrint('Page Height: $pageHeight');
    debugPrint('Page Width: $pageWidth');

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.network(
              "https://images.pexels.com/photos/417074/pexels-photo-41"
                  "7074.jpeg?cs=srgb&dl=pexels-james-wheeler-417074.jpg"
                  "&fm=jpg&w=4226&h=2847&_gl=1*1u9l7f3*_ga*MTAyNDYxOTY2"
                  "Mi4xNjc5NzA0NDQx*_ga_8JE65Q40S6*MTY3OTg3MDIwNS40LjE"
                  "uMTY3OTg3MDIwNS4wLjAuMA..",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                // Header, Upper Part
                Container(
                  // height: 0.45 * PAGE_HEIGHT,
                  child: Column(
                    children: [
                      Image.asset(
                        'images/profile2.png',
                        height: 250,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
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
                      SizedBox(
                        width: 0.3 * MediaQuery.of(context).size.width,
                        child: const Divider(
                          color: Colors.white,
                          // height: 25,

                          thickness: 4,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 0.4 * MediaQuery.of(context).size.width,
                        child: Wrap(
                          children: [
                            Center(
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'Oh! Hi there! Here are a few of my links.',
                                    textStyle: const TextStyle(
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
                                pause: const Duration(seconds: 5),
                                totalRepeatCount: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                        width: 320,
                      ),
                    ],
                  ),
                ),

                // Middle Part, Body
                Container(
                  // height: 0.5 * PAGE_HEIGHT,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.1).withAlpha(1100),
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
                      // Personal Website
                      //   LinkButton(
                      //   text: 'Personal Website',
                      //   link: personalWebsiteURL,
                      //   color: personalWebsiteColor,
                      //   image: personalWebsiteImage,
                      // ),

                      // Personal Website
                      SizedBox(
                        width: LinkButton.WIDTH,
                        height: LinkButton.HEIGHT,
                        child: ElevatedButton(
                          // onPressed: () => LaunchURL(link),
                          onPressed: () =>
                              Navigator.pushNamed(context, '/firstPage'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: personalWebsiteColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                personalWebsiteImage,
                                height: LinkButton.IMAGEHEIGHT,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Personal Website',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: LinkButton.FONTSIZE,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: buttonSpaceHeight,
                        width: buttonSpaceWidth,
                      ),

                      // LinkedIn
                      LinkButton(
                        text: 'LinkedIn',
                        link: linkedInURL,
                        color: linkedInColor,
                        image: linkedInImage,
                      ),

                      SizedBox(
                        height: buttonSpaceHeight,
                        width: buttonSpaceWidth,
                      ),

                      // Twitter
                      LinkButton(
                        text: 'Twitter',
                        link: twitterURL,
                        color: twitterColor,
                        image: twitterImage,
                      ),

                      SizedBox(
                        height: buttonSpaceHeight,
                        width: buttonSpaceWidth,
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
                                backgroundColor: Colors.transparent,
                                fixedSize: const Size(320, 50),
                                disabledForegroundColor: Colors.transparent.withOpacity(0.38),
                                disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
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
                        height: buttonSpaceHeight,
                        width: buttonSpaceWidth,
                      ),

                      // GitHub
                      LinkButton(
                        text: 'GitHub',
                        link: githubURL,
                        color: githubColor,
                        image: githubImage,
                      ),

                      SizedBox(
                        height: buttonSpaceHeight,
                        width: buttonSpaceWidth,
                      ),

                      // YouTube
                      LinkButton(
                        text: 'YouTube',
                        link: youtubeURL,
                        color: youtubeColor,
                        image: youtubeImage,
                      ),

                      SizedBox(
                        height: buttonSpaceHeight,
                        width: buttonSpaceWidth,
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


                // Lower Part, Footer
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 35, 0, 5),
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      alignment: Alignment.bottomCenter,
                      color: Colors.transparent,
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
    );
  }
}