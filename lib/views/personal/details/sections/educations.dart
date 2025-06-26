import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/export.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/education_card.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class Educations extends StatefulWidget {
  const Educations({
    this.showHeader = true,
    super.key,
  });

  final bool showHeader;

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

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.showHeader) ...[
                const Text(
                  'Educations',
                  style: Typo.heading,
                ),
                const BodyDivider(),
              ],
              if (!widget.showHeader) gap24,
              gap12,
              ...educations.map(
                (education) => EducationCard(
                  education: education,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
