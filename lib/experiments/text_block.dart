// Experimental CODE

import 'package:flutter/material.dart';

class Text_block extends StatelessWidget {
  Color color = Colors.white;
  String text = '';


  Text_block(String texts, Color col){
    this.color = col;
    this.text = texts;
  }


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
              child: Text(text, style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
    );
  }
}
