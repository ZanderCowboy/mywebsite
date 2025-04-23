import 'package:flutter/material.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/sections/data/_skills.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';
import 'package:mywebsite/views/personal/details/widgets/skill_card.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isSmallScreen
        ? const _SkillsContent()
        : const SizedBox.expand(
            child: _SkillsContent(),
          );
  }
}

class _SkillsContent extends StatelessWidget {
  const _SkillsContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!context.isSmallScreen) ...[
            const Text(
              'Skills',
              style: PersonalText.heading,
            ),
            const BodyDivider(),
          ],
          gap24,
          LayoutBuilder(
            builder: (context, constraints) {
              final isSmallScreen = constraints.maxWidth < 820;
              final skillsPerRow = isSmallScreen ? 2 : 3;

              return Column(
                children: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
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
                    spacing: 8,
                    runSpacing: 8,
                    children: skills
                        .skip(skillsPerRow)
                        .map((skill) => SkillCard(skill: skill))
                        .toList(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
