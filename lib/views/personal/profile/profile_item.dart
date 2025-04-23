import 'package:flutter/material.dart';
import 'package:mywebsite/util/export.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    required this.icon,
    required this.header,
    required this.description,
    super.key,
  });

  final IconData icon;
  final String header;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ),
        gap24,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: PersonalText.profileTitle,
            ),
            Text(
              description,
              style: PersonalText.profileSubtitle,
            ),
          ],
        ),
      ],
    );
  }
}
