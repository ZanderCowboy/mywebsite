import 'package:flutter/material.dart';
import 'package:mywebsite/models/domain/skill.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/network_image_avatar.dart';

int _levelToStars(String level) {
  final lower = level.toLowerCase();
  if (lower == 'beginner' || lower == '1') return 1;
  if (lower == 'intermediate' || lower == '2') return 2;
  if (lower == 'advanced' || lower == '3') return 3;
  if (lower == 'expert' || lower == '4') return 4;
  if (lower == '5') return 5;
  final parsed = int.tryParse(level);
  if (parsed != null && parsed >= 1 && parsed <= 5) return parsed;
  return 0;
}

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
        padding: allPadding24,
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
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  skill.level,
                  style: Typo.subtitle.copyWith(
                    color: Colors.grey[400],
                  ),
                ),
                if (_levelToStars(skill.level) > 0) ...[
                  gap8,
                  ...List.generate(
                    4,
                    (i) => Icon(
                      i < _levelToStars(skill.level)
                          ? Icons.star
                          : Icons.star_border,
                      size: 18,
                      color: i < _levelToStars(skill.level)
                          ? Colors.amber
                          : Colors.grey,
                    ),
                  ),
                ],
              ],
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
