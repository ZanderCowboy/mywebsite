import 'package:flutter/material.dart';
import 'package:mywebsite/util/ui_constants.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.network(
              "https://images.pexels.com/photos/2049422/pexels-photo-2"
              "049422.jpeg?cs=srgb&dl=pexels-pok-rie-2049422.jpg&fm=jpg&_gl=1*dm5gf8*_ga*M"
              "TAyNDYxOTY2Mi4xNjc5NzA0NDQx*_ga_8JE65Q40S6*MTY3OTkxMTAxMy43LjAuMTY3OTkxMTAx"
              "My4wLjAuMA..",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: vertical20horizontal10,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          alignment: Alignment.center,
                          child: const Text(
                            'Coming Soon',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 100,
                              fontFamily: 'Anton',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: const ButtonStyle(),
                          child: const Text(
                            'Return to Home Page',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
