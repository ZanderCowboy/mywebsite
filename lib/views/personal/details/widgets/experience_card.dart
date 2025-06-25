import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        padding: allPadding16,
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
                  _Image(
                    isLeftAligned: isLeftAligned,
                    imageUrl: experience.companyImageUrl!,
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: isLeftAligned
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Text(
                        experience.role,
                        style: Typo.subtitle,
                      ),
                      Text(
                        experience.company,
                        style: Typo.body.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${experience.location} • ${experience.language}',
                        style: Typo.body.copyWith(
                          color: Colors.grey[400],
                        ),
                      ),
                      Text(
                        experience.duration,
                        style: Typo.body.copyWith(
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLeftAligned && experience.companyImageUrl != null)
                  _Image(
                    isLeftAligned: isLeftAligned,
                    imageUrl: experience.companyImageUrl!,
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
                      const Text('• ', style: Typo.body),
                      Expanded(
                        child: Text(
                          responsibility,
                          style: Typo.body,
                        ),
                      ),
                    ] else ...[
                      Expanded(
                        child: Text(
                          responsibility,
                          style: Typo.body,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const Text(' •', style: Typo.body),
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

class _Image extends StatelessWidget {
  const _Image({
    required this.isLeftAligned,
    required this.imageUrl,
  });

  final bool isLeftAligned;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      margin: isLeftAligned
          ? const EdgeInsets.only(right: 16)
          : const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: borderRadius8,
      ),
      child: ClipRRect(
        borderRadius: borderRadius8,
        child: _buildCompanyImage(imageUrl),
      ),
    );
  }

  Widget _buildCompanyImage(String imageUrl) {
    if (imageUrl.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        imageUrl,
        fit: BoxFit.cover,
        placeholderBuilder: (context) => Container(
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (_, __, ___) {
          return Container(
            color: Colors.grey[200],
            child: const Icon(Icons.business, color: Colors.grey),
          );
        },
      );
    }
  }
}
