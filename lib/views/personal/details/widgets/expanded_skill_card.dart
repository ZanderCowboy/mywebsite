import 'package:flutter/material.dart';
import 'package:mywebsite/models/domain/skill.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/network_image_avatar.dart';

class ExpandedSkillCard extends StatelessWidget {
  const ExpandedSkillCard({
    required this.skill,
    super.key,
  });

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'skill_${skill.name}',
              child: Card(
                color: kSecondaryColor,
                elevation: 8,
                child: Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(16),
                  child: skill.isNetworkImage
                      ? NetworkImageAvatar(
                          imageUrl: skill.imageUrl,
                          width: 200,
                          height: 200,
                        )
                      : Image.asset(
                          skill.imageUrl,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
            ),
            gap24,
            Text(
              skill.name,
              style: Typo.header,
            ),
            gap16,
            Text(
              skill.level,
              style: Typo.subtitle.copyWith(
                color: Colors.grey[400],
              ),
            ),
            gap24,
            Text(
              skill.description,
              style: Typo.body,
              textAlign: TextAlign.center,
            ),
            gap24,
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
