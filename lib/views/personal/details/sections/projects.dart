import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/export.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';
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
  Future<List<Project>?>? _projectsFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _projectsFuture = AllData.projects;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Project>?>(
      future: _projectsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || snapshot.data == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 48,
                  color: Colors.grey[600],
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load projects',
                  style: Typo.body.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _loadData,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }

        final projects = snapshot.data!;

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
                  // TODO @ZanderCowboy: Remove IntrinsicHeight since it is resource intensive
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
      },
    );
  }
}
