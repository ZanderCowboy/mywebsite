// Experimental CODE

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mywebsite/views/secondpage.dart';

class Widget_block extends StatelessWidget {
  final Color color;
  final String text;
  final String page;



  const Widget_block(
      this.color,
      this.text,
      this.page,
      );



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 50.0,
      width: 350.0,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: Colors.white),),

          ElevatedButton(
            child: const Text('Open route', style: TextStyle(color: Colors.white),),
            onPressed: () {
// Navigate to second route when tapped.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
          ),

        ],
      ),
    );
  }
}

