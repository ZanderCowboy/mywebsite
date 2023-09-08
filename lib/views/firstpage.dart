import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double PAGE_HEIGHT = MediaQuery.of(context).size.height;
    // double PAGE_WIDTH = MediaQuery.of(context).size.width;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.network(
              "https://images.pexels.com/photos/2049422/pexels-photo-2"
              "049422.jpeg?cs=srgb&dl=pexels-pok-rie-2049422.jpg&fm=jpg&_gl=1*dm5gf8*_ga*M"
              "TAyNDYxOTY2Mi4xNjc5NzA0NDQx*_ga_8JE65Q40S6*MTY3OTkxMTAxMy43LjAuMTY3OTkxMTAx"
              "My4wLjAuMA..",
              // width: PAGE_WIDTH,
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
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
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
                          onPressed: () => {
                            Navigator.pop(context),
                            // Navigator.pushNamed(context, '/secondPage'),
                          },
                          style: const ButtonStyle(
                            // padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                            // padding: MaterialStateProperty.all<EdgeInsets>(
                            //   EdgeInsets.fromLTRB(10, 0, 10, 20)
                            // ),
                          ),
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
