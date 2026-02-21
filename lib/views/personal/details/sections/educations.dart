import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/export.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/education_card.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class Educations extends StatefulWidget {
  const Educations({
    this.showHeader = true,
    this.wrapInScrollView = true,
    this.useSplit = false,
    super.key,
  });

  final bool showHeader;
  final bool wrapInScrollView;
  final bool useSplit;

  @override
  State<Educations> createState() => _EducationsState();
}

class _EducationsState extends State<Educations> {
  Future<List<Education>?>? _educationsFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _educationsFuture = AllData.educations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Education>?>(
      future: _educationsFuture,
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
                  'Failed to load education',
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

        final educations = snapshot.data!;

        final content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.showHeader) ...[
              const Text(
                'Education',
                style: Typo.heading,
              ),
              const BodyDivider(),
            ],
            if (!widget.showHeader) gap24,
            gap12,
            if (widget.useSplit) ...[
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
      },
    );
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
