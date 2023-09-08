import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/util/launcher.dart';

class LinkButton extends StatelessWidget {
  static const double _height = 50;
  static const double _width = 320;
  static const double _fontSize = 16;
  static const double _imageHeight = 22;
  final String text;
  final String link;
  final Color color;
  final String image;

  const LinkButton({super.key, 
    this.image = 'images/cancel/icons8-cancel-384.svg',
    required this.text,
    required this.link,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
      child: ElevatedButton(
        onPressed: () => launchURL(link),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: _imageHeight,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: _fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static double get imageHeight => _imageHeight;

  static double get fontSize => _fontSize;

  static double get width => _width;

  static double get height => _height;
}
