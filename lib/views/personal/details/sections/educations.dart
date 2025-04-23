import 'package:flutter/material.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/sections/data/_educations.dart';
import 'package:mywebsite/views/personal/details/widgets/education_card.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class Educations extends StatelessWidget {
  const Educations({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isSmallScreen
        ? const _EducationsContent()
        : const SizedBox.expand(
            child: _EducationsContent(),
          );
  }
}

class _EducationsContent extends StatelessWidget {
  const _EducationsContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!context.isSmallScreen) ...[
            const Text(
              'Educations',
              style: PersonalText.heading,
            ),
            const BodyDivider(),
          ],
          gap12,
          ...educations.map((education) => EducationCard(education: education)),
        ],
      ),
    );
  }
}
