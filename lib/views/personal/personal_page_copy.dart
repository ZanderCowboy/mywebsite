import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/details.dart';
import 'package:mywebsite/views/personal/profile/profile.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonalPageCopy extends StatelessWidget {
  const PersonalPageCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => Navigator.pushNamed(context, kHomePageRoute),
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
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
                  child: Image.asset(Assets.images.homePageBackground.path),
                );
              },
            ),
          ),
          Card(
            color: kBackgroundColor,
            margin: allPadding40,
            child: Padding(
              padding: allPadding32,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  dev.log(
                    'maxWidth: ${constraints.maxWidth};',
                    name: 'PersonalPageCopy',
                  );
                  final isSmall = constraints.maxWidth < 750;

                  return isSmall
                      ? const SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Profile(),
                              gap8,
                              Details(isSmall: true),
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: constraints.maxWidth < 1200 ? 2 : 1,
                              child: SizedBox(
                                height: context.screenHeight,
                                child: const Profile(),
                              ),
                            ),
                            gap8,
                            const Flexible(
                              flex: 3,
                              child: Details(),
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
