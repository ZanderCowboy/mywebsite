import 'package:flutter/material.dart';
import 'package:mywebsite/components/timeline.dart';
import 'package:mywebsite/models/domain/experience.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/network_image_avatar.dart';

// Fixed height for all experience cards
const double _gapBetweenCards = 16;

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    required this.experience,
    required this.isLeftAligned,
    super.key,
    this.isLast = false,
    this.isFirst = false,
    this.useParagraphs = false,
  });

  final Experience experience;
  final bool isLast;
  final bool isFirst;
  final bool isLeftAligned;
  final bool useParagraphs;

  @override
  Widget build(BuildContext context) {
    // ignore: omit_local_variable_types
    final double cardFixedHeight = context.isSmallScreen ? 350 : 220;

    final card = Card(
      color: kSecondaryColor,
      margin: EdgeInsets.zero,
      child: SizedBox(
        height: cardFixedHeight,
        child: Padding(
          padding: allPadding16,
          child: Column(
            crossAxisAlignment: isLeftAligned
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
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
              Expanded(
                child: _ResponsibilityContent(
                  responsibilities: experience.responsibilities,
                  isLeftAligned: isLeftAligned,
                  useParagraphs: useParagraphs,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final totalHeight =
        isLast ? cardFixedHeight : cardFixedHeight + _gapBetweenCards;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Timeline(
          cardHeight: cardFixedHeight,
          timelineWidth: 24,
          isFirst: isFirst,
          isLast: isLast,
          height: totalHeight,
        ),
        gap8,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              card,
              if (!isLast) const SizedBox(height: _gapBetweenCards),
            ],
          ),
        ),
        gap4,
      ],
    );
  }
}

class _ResponsibilityContent extends StatelessWidget {
  const _ResponsibilityContent({
    required this.responsibilities,
    required this.isLeftAligned,
    required this.useParagraphs,
  });

  final List<String> responsibilities;
  final bool isLeftAligned;
  final bool useParagraphs;

  @override
  Widget build(BuildContext context) {
    if (useParagraphs) {
      return _MultiColumnText(
        text: responsibilities.join('\n\n'),
        isLeftAligned: isLeftAligned,
      );
    }

    return _MultiColumnResponsibilityList(
      responsibilities: responsibilities,
      isLeftAligned: isLeftAligned,
    );
  }
}

class _MultiColumnText extends StatelessWidget {
  const _MultiColumnText({
    required this.text,
    required this.isLeftAligned,
  });

  final String text;
  final bool isLeftAligned;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const textStyle = Typo.body;
        final textSpan = TextSpan(text: text, style: textStyle);
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        // If text fits in one column, use single column
        if (textPainter.height <= constraints.maxHeight) {
          return SingleChildScrollView(
            child: Text(
              text,
              style: textStyle,
              textAlign: isLeftAligned ? TextAlign.start : TextAlign.end,
            ),
          );
        }

        // Otherwise, split into multiple columns
        return _ColumnTextLayout(
          text: text,
          textStyle: textStyle,
          isLeftAligned: isLeftAligned,
          maxHeight: constraints.maxHeight,
          columnWidth: constraints.maxWidth / 2 - 8,
        );
      },
    );
  }
}

class _ColumnTextLayout extends StatelessWidget {
  const _ColumnTextLayout({
    required this.text,
    required this.textStyle,
    required this.isLeftAligned,
    required this.maxHeight,
    required this.columnWidth,
  });

  final String text;
  final TextStyle textStyle;
  final bool isLeftAligned;
  final double maxHeight;
  final double columnWidth;

  @override
  Widget build(BuildContext context) {
    // Split by paragraphs first (double newlines)
    final paragraphs = text.split('\n\n');
    final columns = <List<String>>[[], []];
    final columnHeights = <double>[0, 0];

    // Distribute paragraphs across columns
    for (final paragraph in paragraphs) {
      // Try to add to the shorter column first
      var targetColumn = columnHeights[0] <= columnHeights[1] ? 0 : 1;

      // Check if paragraph fits in target column
      final testText = [...columns[targetColumn], paragraph]
          .where((p) => p.isNotEmpty)
          .join('\n\n');
      final textPainter = TextPainter(
        text: TextSpan(text: testText, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: columnWidth);

      // If it doesn't fit and column is not empty, try the other column
      if (textPainter.height > maxHeight && columns[targetColumn].isNotEmpty) {
        targetColumn = (targetColumn + 1) % 2;
        final testText2 = [...columns[targetColumn], paragraph]
            .where((p) => p.isNotEmpty)
            .join('\n\n');
        final textPainter2 = TextPainter(
          text: TextSpan(text: testText2, style: textStyle),
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: columnWidth);

        // If still doesn't fit, split the paragraph by sentences
        if (textPainter2.height > maxHeight &&
            columns[targetColumn].isNotEmpty) {
          final sentences = paragraph.split(RegExp(r'[.!?]+\s+'));
          for (final sentence in sentences) {
            if (sentence.trim().isEmpty) continue;

            // Find the column with less height
            final shorterColumn = columnHeights[0] <= columnHeights[1] ? 0 : 1;
            columns[shorterColumn].add(sentence.trim());
            final testSentence =
                columns[shorterColumn].where((p) => p.isNotEmpty).join('. ');
            final sentencePainter = TextPainter(
              text: TextSpan(text: testSentence, style: textStyle),
              textDirection: TextDirection.ltr,
            )..layout(maxWidth: columnWidth);
            columnHeights[shorterColumn] = sentencePainter.height;
          }
          continue;
        } else {
          columns[targetColumn].add(paragraph);
          columnHeights[targetColumn] = textPainter2.height;
        }
      } else {
        columns[targetColumn].add(paragraph);
        columnHeights[targetColumn] = textPainter.height;
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              columns[0].where((p) => p.isNotEmpty).join('\n\n'),
              style: textStyle,
              textAlign: isLeftAligned ? TextAlign.start : TextAlign.end,
            ),
          ),
        ),
        gap16,
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              columns[1].where((p) => p.isNotEmpty).join('\n\n'),
              style: textStyle,
              textAlign: isLeftAligned ? TextAlign.start : TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}

class _MultiColumnResponsibilityList extends StatelessWidget {
  const _MultiColumnResponsibilityList({
    required this.responsibilities,
    required this.isLeftAligned,
  });

  final List<String> responsibilities;
  final bool isLeftAligned;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const textStyle = Typo.body;
        final bulletStyle = textStyle.copyWith(fontSize: 14);

        // Calculate if we need multiple columns
        double totalHeight = 0;
        final itemHeights = <double>[];

        for (final responsibility in responsibilities) {
          final textPainter = TextPainter(
            text: TextSpan(
              text: responsibility,
              style: textStyle,
            ),
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: constraints.maxWidth);
          final height = textPainter.height + 8; // padding
          itemHeights.add(height);
          totalHeight += height;
        }

        // If content fits in one column, use single column
        if (totalHeight <= constraints.maxHeight) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: isLeftAligned
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: responsibilities.map((responsibility) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: isLeftAligned
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isLeftAligned) ...[
                        Text('• ', style: bulletStyle),
                        Expanded(
                          child: Text(
                            responsibility,
                            style: textStyle,
                          ),
                        ),
                      ] else ...[
                        Expanded(
                          child: Text(
                            responsibility,
                            style: textStyle,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Text(' •', style: bulletStyle),
                      ],
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        }

        // Split responsibilities into two columns
        final midPoint = responsibilities.length ~/ 2;
        final firstColumn = responsibilities.sublist(0, midPoint);
        final secondColumn = responsibilities.sublist(midPoint);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: isLeftAligned
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: firstColumn.map((responsibility) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: isLeftAligned
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isLeftAligned) ...[
                            Text('• ', style: bulletStyle),
                            Expanded(
                              child: Text(
                                responsibility,
                                style: textStyle,
                              ),
                            ),
                          ] else ...[
                            Expanded(
                              child: Text(
                                responsibility,
                                style: textStyle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Text(' •', style: bulletStyle),
                          ],
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            gap16,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: isLeftAligned
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: secondColumn.map((responsibility) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: isLeftAligned
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isLeftAligned) ...[
                            Text('• ', style: bulletStyle),
                            Expanded(
                              child: Text(
                                responsibility,
                                style: textStyle,
                              ),
                            ),
                          ] else ...[
                            Expanded(
                              child: Text(
                                responsibility,
                                style: textStyle,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Text(' •', style: bulletStyle),
                          ],
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
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
        child: NetworkImageAvatar(
          imageUrl: imageUrl,
          isCircular: false,
          width: 75,
          height: 75,
        ),
      ),
    );
  }
}
