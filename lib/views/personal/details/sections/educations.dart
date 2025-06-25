import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/education_card.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class Educations extends StatelessWidget {
  const Educations({
    this.showHeader = true,
    super.key,
  });

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    final educations = AllData.educations;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader) ...[
            const Text(
              'Educations',
              style: Typo.heading,
            ),
            const BodyDivider(),
          ],
          if (!showHeader) gap24,
          gap12,
          ...educations.map(
            (education) => EducationCard(
              education: education,
            ),
          ),
        ],
      ),
    );
  }
}
