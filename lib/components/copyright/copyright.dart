import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${DateTime.now().year.toString()} ',
          style: const TextStyle(
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
          ' Zander Kotze',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
