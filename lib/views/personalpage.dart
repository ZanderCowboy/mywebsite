import 'package:flutter/material.dart';
import 'package:mywebsite/util/constants.dart';


class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  // const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Second Route'),
      // ),

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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Second Page'),

                  ElevatedButton(
                    onPressed: () => {
                      // Navigate back to first route when tapped.
                      // Navigator.pop(context),
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