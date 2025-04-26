import 'package:flutter/material.dart';
import 'package:mywebsite/models/skill.dart';
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
            const SizedBox(height: 24),
            Text(
              skill.name,
              style: PersonalText.header,
            ),
            const SizedBox(height: 16),
            Text(
              skill.level,
              style: PersonalText.subtitle.copyWith(
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              skill.description,
              style: PersonalText.body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
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
