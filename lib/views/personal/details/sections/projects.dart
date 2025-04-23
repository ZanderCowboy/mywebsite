import 'package:flutter/material.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/sections/data/_projects.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';
import 'package:mywebsite/views/personal/details/widgets/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!context.isSmallScreen) ...[
            const Text(
              'Projects',
              style: PersonalText.heading,
            ),
            const BodyDivider(),
          ],
          gap24,
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 24,
                children: projects.map((project) {
                  final cardWidth = constraints.maxWidth > 1200
                      ? (constraints.maxWidth - 24) / 2
                      : constraints.maxWidth;

                  return SizedBox(
                    width: cardWidth,
                    child: ProjectCard(project: project),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
