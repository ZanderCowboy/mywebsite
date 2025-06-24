import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/components/copyright.dart';
import 'package:mywebsite/components/link_button.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/util/ui_constants.dart';
import 'package:mywebsite/views/shared/hero_widget.dart';
import 'package:transparent_image/transparent_image.dart';

part 'widgets/_buttons.dart';
part 'widgets/_footer.dart';
part 'widgets/_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image: homePageBackgroundUrl,
              imageErrorBuilder: (_, __, ___) {
                return Center(
                  child: Image.asset(
                    Assets.images.homePageBackground.path,
                  ),
                );
              },
            ),
          ),
          const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Header(),
                _Buttons(),
                _Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
