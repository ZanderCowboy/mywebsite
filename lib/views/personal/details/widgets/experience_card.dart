import 'package:flutter/material.dart';
import 'package:mywebsite/models/experience.dart';
import 'package:mywebsite/util/export.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    required this.experience,
    required this.isLeftAligned,
    super.key,
    this.isLast = false,
    this.isFirst = false,
  });

  final Experience experience;
  final bool isLast;
  final bool isFirst;
  final bool isLeftAligned;

  @override
  Widget build(BuildContext context) {
    final card = Card(
      color: Colors.purple[600],
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              isLeftAligned ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: isLeftAligned
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                if (isLeftAligned && experience.companyImageUrl != null)
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: Image.network(
                          experience.companyImageUrl!,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: isLeftAligned
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Text(
                        experience.role,
                        style: PersonalText.subtitle,
                      ),
                      Text(
                        experience.company,
                        style: PersonalText.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${experience.location} • ${experience.language}',
                        style: PersonalText.body.copyWith(
                          color: Colors.grey[400],
                        ),
                      ),
                      Text(
                        experience.duration,
                        style: PersonalText.body.copyWith(
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLeftAligned && experience.companyImageUrl != null)
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: Image.network(
                          experience.companyImageUrl!,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
            gap16,
            ...experience.responsibilities.map(
              (responsibility) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: isLeftAligned
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isLeftAligned) ...[
                      const Text('• '),
                      Expanded(
                        child: Text(
                          responsibility,
                          style: PersonalText.body,
                        ),
                      ),
                    ] else ...[
                      Expanded(
                        child: Text(
                          responsibility,
                          style: PersonalText.body,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const Text(' •'),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final timeline = SizedBox(
      width: 40,
      child: Column(
        children: [
          if (isFirst) ...[
            Container(
              width: 0,
              height: 100,
              color: Colors.grey[300],
            ),
          ],
          if (!isFirst) ...[
            Container(
              width: 2,
              height: 110,
              color: Colors.grey[300],
            ),
          ],
          const _Dot(),
          if (!isLast) ...[
            Container(
              width: 2,
              height: 110,
              color: Colors.grey[300],
            ),
          ],
        ],
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        timeline,
        gap8,
        Expanded(child: card),
        gap4,
        // if (isLeftAligned) ...[
        //   timeline,
        //   const SizedBox(width: 20),
        //   Expanded(child: card),
        // ] else ...[
        //   Expanded(child: card),
        //   const SizedBox(width: 20),
        //   timeline,
        // ],
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple[700],
          ),
        ),
      ],
    );
  }
}
