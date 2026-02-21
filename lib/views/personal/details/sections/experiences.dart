import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/export.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/experience_card.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

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
  Future<List<Experience>?>? _experiencesFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _experiencesFuture = AllData.experiences;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Experience>?>(
      future: _experiencesFuture,
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
                  'Failed to load experiences',
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

        final experiences = snapshot.data!;
        final useParagraphs =
            widget.flags[RemoteConfigFeatureFlags.experienceUseParagraphs] ??
                false;

        final content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.showHeader) ...[
              const Text(
                'Experience',
                style: Typo.heading,
              ),
              const BodyDivider(),
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
      },
    );
  }
}
