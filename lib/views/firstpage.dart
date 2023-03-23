import 'package:flutter/material.dart';
import 'package:mywebsite/route/route.dart' as route;


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  // const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),

      body: Center(
        child: ElevatedButton(
          child:
            const Text('Open route', style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pushNamed(context, route.secondPage),
        ),
      ),
    );
  }
}

