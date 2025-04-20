// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/util/ui_constants.dart';
import 'package:mywebsite/views/personal/details/details.dart';
import 'package:mywebsite/views/personal/profile/profile.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => Navigator.pushNamed(context, kHomePageRoute),
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: ColoredBox(
              // color: Color(0xFF121212),
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
          Card(
            color: Color(0xFF121212),
            margin: allPadding40,
            child: Center(
              child: Padding(
                padding: allPadding32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Profile(),
                    width8,
                    const Details(),
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
