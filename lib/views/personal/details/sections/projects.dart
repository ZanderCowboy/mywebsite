import 'package:flutter/material.dart';
import 'package:mywebsite/components/export.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/project_card.dart';

class Projects extends StatefulWidget {
  const Projects({
    this.showHeader = true,
    this.wrapInScrollView = true,
    super.key,
  });

  final bool showHeader;
  final bool wrapInScrollView;

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final projects = AllData.instance.projects;

    if (projects == null || projects.isEmpty) {
      return const Center(
        child: Text('No projects available.'),
      );
    }

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showHeader) ...[
          const Text(
            'Projects',
            style: Typo.heading,
          ),
          const BodyDivider(),
        ],
        if (!widget.showHeader) gap24,
        LayoutBuilder(
          builder: (context, constraints) {
            final useEqualHeight =
                constraints.maxWidth > 1200 && projects.length >= 2;

            if (useEqualHeight) {
              // TODO(ZanderCowboy): Remove IntrinsicHeight since it is resource intensive.
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: projects
                      .map(
                        (project) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: ProjectCard(
                              project: project,
                              expandDescription: true,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            }

            return Wrap(
              spacing: 24,
              children: projects
                  .map(
                    (project) => SizedBox(
                      width: constraints.maxWidth > 1200
                          ? (constraints.maxWidth - 24) / 2
                          : constraints.maxWidth,
                      child: ProjectCard(project: project),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );

    if (widget.wrapInScrollView) {
      return SingleChildScrollView(child: content);
    }
    return content;
  }
}
