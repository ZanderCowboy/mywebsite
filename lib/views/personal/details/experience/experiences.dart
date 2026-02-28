import 'package:flutter/material.dart';
import 'package:mywebsite/components/body_divider.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/shared/experience_card.dart';

class Experiences extends StatefulWidget {
  const Experiences({
    required this.flags,
    this.showHeader = true,
    this.wrapInScrollView = true,
    super.key,
  });

  final bool showHeader;
  final bool wrapInScrollView;
  final Map<RemoteConfigFeatureFlags, bool> flags;

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  @override
  Widget build(BuildContext context) {
    final experiences = AllData.instance.experiences;

    if (experiences == null || experiences.isEmpty) {
      return const Center(
        child: Text('No experiences available.'),
      );
    }
    final useParagraphs =
        widget.flags[RemoteConfigFeatureFlags.experienceUseParagraphs] ?? false;

    final content = Column(
      children: [
        if (widget.showHeader) ...[
          const Text(
            'Experience',
            style: Typo.heading,
          ),
          BodyDivider(
            width: context.isMobile ? null : 80,
          ),
        ],
        if (!widget.showHeader) gap24,
        gap16,
        ...List.generate(
          experiences.length,
          (index) => ExperienceCard(
            experience: experiences[index],
            isFirst: index == 0,
            isLast: index == experiences.length - 1,
            isLeftAligned: index.isEven,
            useParagraphs: useParagraphs,
          ),
        ),
      ],
    );

    if (widget.wrapInScrollView) {
      return SingleChildScrollView(child: content);
    }
    return content;
  }
}
