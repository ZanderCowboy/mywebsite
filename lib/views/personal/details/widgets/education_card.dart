import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/education.dart';
import 'package:mywebsite/util/export.dart';

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
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                if (education.imageUrl != null)
                  _buildLogoImage(education.imageUrl!)
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
                          education.degree ?? '',
                          style: PersonalText.subtitle,
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
            education.schoolName ?? '',
            style: PersonalText.title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 16,
            bottom: 16,
          ),
          child: Text(
            education.description ?? '',
            style: PersonalText.body,
          ),
        ),
        gap16,
      ],
    );
  }

  Widget _buildLogoImage(String imageUrl) {
    return GestureDetector(
      onTap: education.schoolUrl != null
          ? () => launchURL(education.schoolUrl!)
          : null,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            width: 45,
            height: 45,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              );
            },
            errorBuilder: (_, __, ___) {
              return CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(Assets.images.placeholder.path),
                backgroundColor: Colors.grey[200],
              );
            },
          ),
        ),
      ),
    );
  }
}
