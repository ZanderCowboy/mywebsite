import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/export.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';
import 'package:mywebsite/views/personal/details/widgets/skill_card.dart';

class Skills extends StatefulWidget {
  const Skills({
    this.showHeader = true,
    super.key,
  });

  final bool showHeader;

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
                  'Failed to load skills',
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

        final skills = snapshot.data!;

        return SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.showHeader) ...[
                  const Text(
                    'Skills',
                    style: Typo.heading,
                  ),
                  const BodyDivider(),
                ],
                if (!widget.showHeader) gap24,
                gap24,
                Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmallScreen = constraints.maxWidth < 820;
                      final skillsPerRow = isSmallScreen ? 2 : 3;

                      return Column(
                        children: [
                          Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            alignment: WrapAlignment.center,
                            children: skills
                                .take(skillsPerRow)
                                .map(
                                  (skill) => SizedBox(
                                    width: 180,
                                    height: 180,
                                    child: SkillCard(
                                      skill: skill,
                                      isLarge: true,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          gap24,
                          Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: skills
                                .skip(skillsPerRow)
                                .map((skill) => SkillCard(skill: skill))
                                .toList(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
