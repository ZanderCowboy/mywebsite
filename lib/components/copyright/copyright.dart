import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateTime.now().year.toString();
    const String nameSurname = 'Zander Kotze';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$date ',
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
          ' $nameSurname',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
