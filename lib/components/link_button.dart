import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/util/launcher.dart';

class LinkButton extends StatelessWidget {
  final double _HEIGHT = 50;
  final double _WIDTH = 320;
  final double _FONTSIZE = 16;
  final double _IMAGEHEIGHT = 22;
  final String text;
  final String link;
  final Color color;
  final String image;

  LinkButton({
    this.image = 'images/cancel/icons8-cancel-384.svg',
    required this.text,
    required this.link,
    required this.color,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     width: _WIDTH,
  //     height: _HEIGHT,
  //     child: ElevatedButton(
  //       onPressed: () => LaunchURL(link),
  //       style: ElevatedButton.styleFrom(primary: color,),
  //       child: Text(text),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _WIDTH,
      height: _HEIGHT,
      child: ElevatedButton(
        onPressed: () => LaunchURL(link),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: _IMAGEHEIGHT,
            ),
            // Image(image: AssetImage("images/github/icons8-github-256.png"),
            //   height: 22,
            // ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: _FONTSIZE,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
