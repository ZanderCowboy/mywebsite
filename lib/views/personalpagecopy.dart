import 'package:flutter/material.dart';
import 'package:mywebsite/util/constants.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned.fill(
            child: ColoredBox(
              color: Colors.blue,
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Second Page'),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, homePageRoute),
                    },
                    child: const Text('Home Page'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
