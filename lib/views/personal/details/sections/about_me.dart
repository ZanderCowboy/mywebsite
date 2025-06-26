import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/components/social_pill.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/export.dart';
import 'package:mywebsite/models/export.dart' as models;
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({
    this.showHeader = true,
    super.key,
  });

  final bool showHeader;

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  Future<models.AboutMeData?>? _aboutMeFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _aboutMeFuture = AllData.aboutMe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<models.AboutMeData?>(
      future: _aboutMeFuture,
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
                  'Failed to load data',
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

        final aboutMe = snapshot.data!;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.showHeader) ...[
                const Text(
                  'About Me',
                  style: Typo.heading,
                ),
                const BodyDivider(),
              ],
              if (!widget.showHeader) gap24,
              gap24,
              Text(
                aboutMe.description,
                style: Typo.body,
              ),
              gap16,
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: aboutMe.socialPills.map((socialPill) {
                  final socialPlatform =
                      SocialPlatform.fromString(socialPill.name);
                  return SocialPill(
                    iconWidget: socialPlatform != null
                        ? SvgPicture.asset(
                            socialPlatform.assetPath,
                            height: 20,
                            width: 20,
                          )
                        : const Icon(Icons.link, size: 20),
                    label: socialPill.name,
                    onTap: () => launchURL(socialPill.url),
                  );
                }).toList(),
              ),
              gap16,
              const Padding(
                padding: vertical12,
                child: Text(
                  "What I'm doing",
                  style: Typo.heading,
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  dev.log('Max Width: $maxWidth', name: 'AboutMe');

                  return GridView.count(
                    crossAxisCount: context.isSmallScreen
                        ? 1
                        : maxWidth < 550
                            ? 1
                            : 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: context.isSmallScreen ? 4 : 3,
                    padding: allPadding4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...aboutMe.professionalSkills.map(
                        (skill) => GridItem(
                          icon: Icons.code,
                          title: skill,
                          subtitle: 'Professional Skill',
                        ),
                      ),
                      ...aboutMe.personalInterests.map(
                        (interest) => GridItem(
                          icon: Icons.favorite,
                          title: interest,
                          subtitle: 'Personal Interest',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
