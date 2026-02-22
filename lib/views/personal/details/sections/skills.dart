import 'package:flutter/material.dart';
import 'package:mywebsite/components/export.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/export.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/skill_card.dart';

class Skills extends StatefulWidget {
  const Skills({
    this.showHeader = true,
    this.wrapInScrollView = true,
    super.key,
  });

  final bool showHeader;
  final bool wrapInScrollView;

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  Future<List<Skill>?>? _skillsFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _skillsFuture = AllData.skills;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Skill>?>(
      future: _skillsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || snapshot.data == null) {
          return ErrorWithRetry(
            errorMessage: 'Failed to load skills',
            onPressed: _loadData,
          );
        }

        final skills = snapshot.data!;

        final content = SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showHeader) ...[
                const Text(
                  'Skills',
                  style: Typo.heading,
                ),
                const BodyDivider(),
              ],
              if (!widget.showHeader) gap24,
              gap18,
              Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isSmallScreen = constraints.maxWidth < 820;
                    const importantSkillsCount = 3;
                    final importantSkillsList =
                        skills.take(importantSkillsCount).toList();
                    final restSkillsList =
                        skills.skip(importantSkillsCount).toList();

                    // Create rows of important skills (2 per row, last row can have 1)
                    final importantRows = <List<Skill>>[];
                    for (var i = 0; i < importantSkillsList.length; i += 2) {
                      if (i + 1 < importantSkillsList.length) {
                        importantRows.add([
                          importantSkillsList[i],
                          importantSkillsList[i + 1],
                        ]);
                      } else {
                        importantRows.add([importantSkillsList[i]]);
                      }
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Important skills section
                        ...importantRows.map((row) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              alignment: WrapAlignment.center,
                              children: row
                                  .map(
                                    (skill) => SizedBox(
                                      width: isSmallScreen ? 180 : 210,
                                      height: 260,
                                      child: SkillCard(
                                        skill: skill,
                                        isLarge: true,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        }),
                        if (importantSkillsList.isNotEmpty) gap32,
                        // Rest of skills section
                        if (restSkillsList.isNotEmpty)
                          Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            alignment: WrapAlignment.center,
                            children: restSkillsList
                                .map(
                                  (skill) => SizedBox(
                                    width: isSmallScreen ? 140 : 170,
                                    height: 220,
                                    child: SkillCard(
                                      skill: skill,
                                      isLarge: true,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );

        if (widget.wrapInScrollView) {
          return SingleChildScrollView(child: content);
        }
        return content;
      },
    );
  }
}
