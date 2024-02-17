import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/util/launcher.dart';
import 'package:mywebsite/util/ui_constants.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    this.buttonImage = 'images/cancel/icons8-cancel-384.svg',
    this.onPressed,
    required this.buttonText,
    this.link,
    this.style,
    this.backgroundColor,
  }) : assert(onPressed != null || link != null,
            "Either onPressed or link need to be non-null");

  final String buttonText;
  final String? link;
  final Color? backgroundColor;
  final String buttonImage;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed ?? () => launchURL(link ?? ''),
        style: style ??
            ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius5,
              ),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              buttonImage,
              height: 22,
            ),
            width8,
            Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
