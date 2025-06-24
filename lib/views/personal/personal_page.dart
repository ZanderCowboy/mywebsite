import 'package:flutter/material.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/util/ui_constants.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
              image: personalPageBackgroundUrl,
              imageErrorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Image.asset('assets/images/personal_page.jpg'),
                );
              },
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: vertical20horizontal10,
                child: Column(
                  children: [
                    const Text(
                      'Coming Soon',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 100,
                        fontFamily: 'Anton',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Return to Home Page',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
