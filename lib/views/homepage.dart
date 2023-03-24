import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/components/copyright/copyright.dart';
import 'package:mywebsite/components/link_button.dart';
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
  final double SPACE_HEIGHT = 10.0;
  static const IconData copyright = IconData(0xe198, fontFamily: 'MaterialIcons');
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

      body: SingleChildScrollView(
        child: Container(
        // Container(

          // width: double.infinity,
          // height: double.infinity,
          height: MediaQuery.of(context).size.height,

          decoration: BoxDecoration(
            // color: Colors.transparent,
            // gradient: LinearGradient(
            //   begin: Alignment.bottomLeft,
            //   end: Alignment.topRight,
            //   colors: [
            //     Color(0xFFFFD600),
            //     Color(0xFFFF7A00),
            //     Color(0xFFFF0069),
            //     Color(0xFFD300C5),
            //     Color(0xFF7638FA),
            //   ],
            // ),
            image: DecorationImage(
              image: AssetImage("images/image1.jpeg"),
              // image: SvgPicture.asset(pictureProvider),

              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // height: 300,
                child: Column(
                  children: [
                    SvgPicture.asset('images/cancel/icons8-cancel-384.svg',
                      height: 200.0,),
                    const SizedBox(height: 4,),
                    const Text('Zander Kotze',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const Text('Some description',
                      style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ),


              SizedBox(height: SPACE_HEIGHT + 50, width: 320.0,),

              LinkButton(text: 'Personal Website', link: personalWebsiteURL, color: personalWebsiteColor),

              SizedBox(height: SPACE_HEIGHT, width: 320.0,),

              LinkButton(text: 'LinkedIn', link: linkedInURL, color: linkedInColor, image: linkedInImage,),

              SizedBox(height: SPACE_HEIGHT, width: 320.0,),

              LinkButton(text: 'Twitter', link: twitterURL, color: twitterColor, image: twitterImage,),

              SizedBox(height: SPACE_HEIGHT, width: 320.0,),

              // Instagram
              DecoratedBox(decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    // Color(0xFF405DE6),
                    // Color(0xFF5851DB),
                    // Color(0xFF833AB4),
                    // Color(0xFFC13584),
                    // Color(0xFFC13584),
                    // Color(0xFFE1306C),
                    // Color(0xFFFD1D1D),
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
                      SvgPicture.asset("images/instagram/icons8-instagram-384.svg", width: 25,),
                      const SizedBox(width: 8,),
                      const Text('Instagram', style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                )
              ),


              SizedBox(height: SPACE_HEIGHT, width: 320.0,),

              // GitHub
              LinkButton(text: 'GitHub', link: githubURL, color: githubColor, image: githubImage,),

              SizedBox(height: SPACE_HEIGHT, width: 320.0,),

              LinkButton(text: 'YouTube', link: youtubeURL, color: youtubeColor, image: youtubeImage,),

              // Expanded(child: Container()),
              SizedBox(
                // height: MediaQuery.of(context).size.height,
                height: 100,
                width: 320.0,
              ),

              Container(
                // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                alignment: Alignment.center,
                color: Colors.transparent,
                height: 50,
                width: MediaQuery.of(context).size.width,

                child: const Copyright(),


              )
            ],
          ),
        ),
      ),
    );
  }
}

