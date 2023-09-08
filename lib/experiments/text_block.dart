// Experimental CODE

import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {
  final Color color = Colors.white;
  final String text = '';

  const TextBlock({super.key});

  // Text_block(String texts, Color col, {super.key}){
  //   color = col;
  //   text = texts;
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 50,
      width: 350.0,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }
}
