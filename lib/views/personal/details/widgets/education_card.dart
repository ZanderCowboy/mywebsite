import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/domain/education.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/network_image_avatar.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    required this.education,
    super.key,
  });

  final Education education;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 4,
          color: kSecondaryColor,
          child: Padding(
            padding: allPadding8,
            child: Row(
              children: [
                if (education.imageUrl != null)
                  NetworkImageAvatar(
                    imageUrl: education.imageUrl!,
                    onTap: education.schoolUrl != null
                        ? () => launchURL(education.schoolUrl!)
                        : null,
                  )
                else
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(Assets.images.placeholder.path),
                    backgroundColor: Colors.grey[200],
                  ),
                gap16,
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          education.degree,
                          style: Typo.subtitle,
                        ),
                      ),
                      if (education.link != null)
                        IconButton(
                          icon: const Icon(Icons.link),
                          onPressed: () {
                            launchURL(education.link!);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 16,
            bottom: 8,
          ),
          child: Text(
            education.schoolName,
            style: Typo.title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 16,
            bottom: 16,
          ),
          child: Text(
            education.description,
            style: Typo.body,
          ),
        ),
        gap16,
      ],
    );
  }
}
