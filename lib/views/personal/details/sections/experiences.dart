import 'package:flutter/material.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/sections/data/_experiences.dart';
import 'package:mywebsite/views/personal/details/widgets/experience_card.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

const companyUrl =
    'https://static.vecteezy.com/system/resources/previews/022/782/608/large_2x/url-letter-logo-design-in-illustration-logo-calligraphy-designs-for-logo-poster-invitation-etc-vector.jpg';

class Experiences extends StatelessWidget {
  const Experiences({
    this.showHeader = true,
    super.key,
  });

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader) ...[
            const Text(
              'Experience',
              style: PersonalText.heading,
            ),
            const BodyDivider(),
          ],
          if (!showHeader) gap24,
          gap16,
          ...List.generate(
            experiences.length,
            (index) => ExperienceCard(
              experience: experiences[index],
              isFirst: index == 0,
              isLast: index == experiences.length - 1,
              isLeftAligned: index.isEven,
            ),
          ),
        ],
      ),
    );
  }
}
