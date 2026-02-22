import 'package:flutter/material.dart';
import 'package:mywebsite/models/domain/skill.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/utils/level_to_stars.dart';
import 'package:mywebsite/views/personal/details/widgets/expanded_skill_card.dart';
import 'package:mywebsite/views/personal/details/widgets/network_image_avatar.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({
    required this.skill,
    this.isLarge = false,
    super.key,
  });

  final Skill skill;
  final bool isLarge;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final stars = levelToStars(widget.skill.level);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_hovered ? 1.05 : 1.0),
        transformAlignment: Alignment.center,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: borderRadius12),
          color: kSecondaryColor,
          elevation: _hovered ? 8 : 4,
          margin: allPadding8,
          child: InkWell(
            onTap: () {
              showDialog<Dialog>(
                context: context,
                builder: (_) => ExpandedSkillCard(skill: widget.skill),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                gap8,
                Hero(
                  tag: 'skill_${widget.skill.name}',
                  child: widget.skill.isNetworkImage
                      ? NetworkImageAvatar(
                          imageUrl: widget.skill.imageUrl,
                          radius: 40,
                          width: widget.isLarge ? 116 : 80,
                          height: widget.isLarge ? 116 : 80,
                          isCircular: false,
                        )
                      : Image.asset(
                          widget.skill.imageUrl,
                          fit: BoxFit.contain,
                          width: widget.isLarge ? 116 : 80,
                          height: widget.isLarge ? 116 : 80,
                        ),
                ),
                gap8,
                Padding(
                  padding: horizontal8,
                  child: Text(
                    widget.skill.name,
                    style: Typo.subtitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (stars > 0) ...[
                  gap4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (i) => Icon(
                        i < stars ? Icons.star : Icons.star_border,
                        size: 14,
                        color: i < stars ? Colors.amber : Colors.grey,
                      ),
                    ),
                  ),
                ],
                gap18,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
