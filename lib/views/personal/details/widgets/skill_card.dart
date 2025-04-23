import 'package:flutter/material.dart';
import 'package:mywebsite/models/skill.dart';
import 'package:mywebsite/util/color_constants.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/expanded_skill_card.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    required this.skill,
    super.key,
  });

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor,
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          showDialog<Dialog>(
            context: context,
            builder: (_) => ExpandedSkillCard(skill: skill),
          );
        },
        child: Container(
          width: 120,
          height: 120,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'skill_${skill.name}',
                child: Expanded(
                  child: Image.asset(
                    skill.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
