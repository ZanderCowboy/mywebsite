import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    this.showHeader = true,
    super.key,
  });

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    final aboutMe = AllData.aboutMe;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showHeader) ...[
            const Text(
              'About Me',
              style: Typo.heading,
            ),
            const BodyDivider(),
          ],
          if (!showHeader) gap24,
          gap24,
          Text(
            aboutMe.description,
            style: Typo.body,
          ),
          gap16,
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: aboutMe.socialLinks.entries.map((entry) {
              return TextButton.icon(
                onPressed: () {},
                icon: Icon(_getSocialIcon(entry.key)),
                label: Text(entry.key),
              );
            }).toList(),
          ),
          const Padding(
            padding: vertical12,
            child: Text(
              "What I'm doing",
              style: Typo.heading,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              dev.log('Max Width: $maxWidth', name: 'AboutMe');

              return GridView.count(
                crossAxisCount: context.isSmallScreen
                    ? 1
                    : maxWidth < 550
                        ? 1
                        : 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: context.isSmallScreen ? 4 : 3,
                padding: allPadding4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...aboutMe.skills.map(
                    (skill) => GridItem(
                      icon: Icons.code,
                      title: skill,
                      subtitle: 'Professional Skill',
                    ),
                  ),
                  ...aboutMe.interests.map(
                    (interest) => GridItem(
                      icon: Icons.favorite,
                      title: interest,
                      subtitle: 'Personal Interest',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  IconData _getSocialIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.business;
      case 'twitter':
        return Icons.chat;
      default:
        return Icons.link;
    }
  }
}
