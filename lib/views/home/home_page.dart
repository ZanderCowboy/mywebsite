import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/components/copyright.dart';
import 'package:mywebsite/components/link_button.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/util/ui_constants.dart';
import 'package:transparent_image/transparent_image.dart';

part 'widgets/buttons.dart';
part 'widgets/footer.dart';
part 'widgets/header.dart';

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
              imageErrorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Image.asset('assets/images/home_page.jpg'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, personalPageRoute),
        tooltip: 'Go to Personal Page',
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
