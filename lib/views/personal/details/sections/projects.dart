import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';
import 'package:mywebsite/views/personal/details/widgets/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({
    this.showHeader = true,
    super.key,
  });

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    final projects = AllData.projects;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader) ...[
            const Text(
              'Projects',
              style: Typo.heading,
            ),
            const BodyDivider(),
          ],
          if (!showHeader) gap24,
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
