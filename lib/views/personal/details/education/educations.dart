import 'package:flutter/material.dart';
import 'package:mywebsite/components/export.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/export.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/shared/education_card.dart';

class Educations extends StatefulWidget {
  const Educations({
    required this.flags,
    this.showHeader = true,
    this.wrapInScrollView = true,
    super.key,
  });

  final bool showHeader;
  final bool wrapInScrollView;
  final Map<RemoteConfigFeatureFlags, bool> flags;

  @override
  State<Educations> createState() => _EducationsState();
}

class _EducationsState extends State<Educations> {
  @override
  Widget build(BuildContext context) {
    final educations = AllData.instance.educations;

    if (educations == null || educations.isEmpty) {
      return const Center(
        child: Text('No education records available.'),
      );
    }
    final useSplit =
        widget.flags[RemoteConfigFeatureFlags.educationUseSplit] ?? false;

    final content = Column(
      children: [
        if (widget.showHeader) ...[
          const Text(
            'Education',
            style: Typo.heading,
          ),
          BodyDivider(
            width: context.isMobile ? null : 80,
          ),
        ],
        if (!widget.showHeader) gap24,
        gap12,
        if (useSplit) ...[
          ..._buildSplitSection(educations),
        ] else ...[
          ...educations.map(
            (e) => EducationCard(education: e),
          ),
        ],
      ],
    );

    if (widget.wrapInScrollView) {
      return SingleChildScrollView(child: content);
    }
    return content;
  }

  List<Widget> _buildSplitSection(List<Education> educations) {
    final accreditation =
        educations.where((e) => e.type?.toLowerCase() == 'accreditation');
    final formal =
        educations.where((e) => e.type?.toLowerCase() != 'accreditation');

    return [
      if (accreditation.isNotEmpty) ...[
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Accreditation',
            style: Typo.heading.copyWith(fontSize: 20),
          ),
        ),
        ...accreditation.map(
          (e) => EducationCard(education: e),
        ),
        gap16,
      ],
      if (formal.isNotEmpty) ...[
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Formal Education',
            style: Typo.heading.copyWith(fontSize: 20),
          ),
        ),
        ...formal.map(
          (e) => EducationCard(education: e),
        ),
      ],
    ];
  }
}
