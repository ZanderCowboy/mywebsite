import 'package:flutter/material.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/sections/data/_about_me.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isSmallScreen
        ? const _AboutMeContent()
        : const SizedBox.expand(
            child: _AboutMeContent(),
          );
  }
}

class _AboutMeContent extends StatelessWidget {
  const _AboutMeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!context.isSmallScreen) ...[
            const Text(
              'About Me',
              style: PersonalText.heading,
            ),
            const BodyDivider(),
          ],
          gap24,
          Text(
            aboutMe.description,
            style: PersonalText.body,
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
              style: PersonalText.heading,
            ),
          ),
          GridView.count(
            crossAxisCount: context.isSmallScreen ? 1 : 2,
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
