import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/domain/education.dart';
import 'package:mywebsite/models/parameters.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/shared/network_image_avatar.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    required this.education,
    super.key,
  });

  final Education education;

  void _handleSchoolUrlClick(String url, String schoolName) {
    launchURL(
      url,
      analyticsParams: Parameters(
        url: url,
        section: 'personal_page',
        tabName: 'Education',
        itemType: 'school_logo',
        itemName: schoolName,
        linkType: 'education',
      ),
    );
  }

  void _handleEducationLinkClick(String url, String degree) {
    launchURL(
      url,
      analyticsParams: Parameters(
        url: url,
        section: 'personal_page',
        tabName: 'Education',
        itemType: 'education_link',
        itemName: degree,
        linkType: 'education',
      ),
    );
  }

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
                        ? () => _handleSchoolUrlClick(
                              education.schoolUrl!,
                              education.schoolName,
                            )
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
                      Text(
                        education.displayDate,
                        style: Typo.subtitle.copyWith(
                          color: Colors.grey[400],
                          fontSize: 11,
                        ),
                      ),
                      if (education.link != null)
                        IconButton(
                          icon: const Icon(Icons.link),
                          onPressed: () {
                            _handleEducationLinkClick(
                              education.link!,
                              education.degree,
                            );
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
