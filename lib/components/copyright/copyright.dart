import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateTime.now().year.toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          date,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            ),
        ),
        const Icon(
          Icons.copyright,
          color: Colors.white,
          size: 20,
        ),
        const Text(
          'Zander Kotze',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
