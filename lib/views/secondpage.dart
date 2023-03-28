import 'package:flutter/material.dart';
import 'package:mywebsite/util/constants.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  // const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),

      body: Container(
        child: Center(
          child: Column(
            children: [
              const Text('Second Page'),

              ElevatedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  Navigator.pop(context);
                },
                child: const Text('Go back!'),
              ),
            ],
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () => Navigator.pushNamed(context, firstPageRoute),
      ),
    );
  }
}