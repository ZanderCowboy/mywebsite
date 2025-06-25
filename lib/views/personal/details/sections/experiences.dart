import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/experience_card.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class Experiences extends StatelessWidget {
  const Experiences({
    this.showHeader = true,
    super.key,
  });

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    final experiences = AllData.experiences;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader) ...[
            const Text(
              'Experience',
              style: Typo.heading,
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
