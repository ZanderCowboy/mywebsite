import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';
import 'package:mywebsite/views/personal/details/widgets/skill_card.dart';

class Skills extends StatelessWidget {
  const Skills({
    this.showHeader = true,
    super.key,
  });

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    final skills = AllData.skills;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showHeader) ...[
              const Text(
                'Skills',
                style: Typo.heading,
              ),
              const BodyDivider(),
            ],
            if (!showHeader) gap24,
            gap24,
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmallScreen = constraints.maxWidth < 820;
                  final skillsPerRow = isSmallScreen ? 2 : 3;

                  return Column(
                    children: [
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        alignment: WrapAlignment.center,
                        children: skills
                            .take(skillsPerRow)
                            .map(
                              (skill) => SizedBox(
                                width: 220,
                                height: 220,
                                child: SkillCard(skill: skill),
                              ),
                            )
                            .toList(),
                      ),
                      gap24,
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: skills
                            .skip(skillsPerRow)
                            .map((skill) => SkillCard(skill: skill))
                            .toList(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
