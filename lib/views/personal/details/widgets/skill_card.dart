import 'package:flutter/material.dart';
import 'package:mywebsite/models/domain/skill.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/expanded_skill_card.dart';
import 'package:mywebsite/views/personal/details/widgets/network_image_avatar.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    required this.skill,
    this.isLarge = false,
    super.key,
  });

  final Skill skill;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor,
      elevation: 4,
      margin: allPadding8,
      child: InkWell(
        onTap: () {
          showDialog<Dialog>(
            context: context,
            builder: (_) => ExpandedSkillCard(skill: skill),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'skill_${skill.name}',
              child: skill.isNetworkImage
                  ? NetworkImageAvatar(
                      imageUrl: skill.imageUrl,
                      radius: 40,
                      width: isLarge ? 120 : 80,
                      height: isLarge ? 120 : 80,
                      isCircular: false,
                    )
                  : Image.asset(
                      skill.imageUrl,
                      fit: BoxFit.contain,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
