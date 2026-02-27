import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/components/export.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/export.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/export.dart' as models;
import 'package:mywebsite/models/parameters.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({
    required this.flags,
    this.showHeader = true,
    this.wrapInScrollView = true,
    super.key,
  });

  final bool showHeader;
  final bool wrapInScrollView;
  final Map<RemoteConfigFeatureFlags, bool> flags;

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

  void _handleCVDownload(String cvUrl) {
    launchURL(
      cvUrl,
      analyticsParams: Parameters(
        url: cvUrl,
        section: 'personal_page',
        tabName: 'About Me',
        itemType: 'cv',
        linkType: 'download',
      ),
    );
  }

  void _handleSocialPillClick(String platform, String url) {
    launchURL(
      url,
      analyticsParams: Parameters(
        platform: platform,
        url: url,
        section: 'personal_page',
        tabName: 'About Me',
        itemType: 'social_pill',
        linkType: 'social_media',
      ),
    );
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
          return ErrorWithRetry(
            errorMessage: 'Failed to load about me data',
            onPressed: _loadData,
          );
        }

        final aboutMe = snapshot.data!;
        final showQuote =
            widget.flags[RemoteConfigFeatureFlags.aboutMeShowQuote] ?? false;
        final useSplit =
            widget.flags[RemoteConfigFeatureFlags.aboutMeUseSplit] ?? false;

        final content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.showHeader) ...[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'About Me',
                      style: Typo.heading,
                    ),
                  ),
                ],
              ),
              const BodyDivider(),
            ],
            if (showQuote &&
                aboutMe.quote != null &&
                aboutMe.quote!.isNotEmpty) ...[
              if (widget.showHeader) gap16 else gap40,
              Padding(
                padding: vertical8,
                child: Text(
                  aboutMe.quote!,
                  style: Typo.body.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              gap8,
            ],
            LayoutBuilder(
              builder: (context, constraints) {
                final useTwoColumns = useSplit &&
                    constraints.maxWidth >= 550 &&
                    (aboutMe.ongoingProjectsText != null &&
                        aboutMe.ongoingProjectsText!.isNotEmpty);

                if (useTwoColumns) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          aboutMe.description,
                          style: Typo.body,
                        ),
                      ),
                      gap16,
                      Expanded(
                        child: Text(
                          aboutMe.ongoingProjectsText!,
                          style: Typo.body,
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      aboutMe.description,
                      style: Typo.body,
                    ),
                    if (aboutMe.ongoingProjectsText != null &&
                        aboutMe.ongoingProjectsText!.isNotEmpty) ...[
                      gap16,
                      Text(
                        aboutMe.ongoingProjectsText!,
                        style: Typo.body,
                      ),
                    ],
                  ],
                );
              },
            ),
            gap16,
            Builder(
              builder: (context) {
                final showCv =
                    aboutMe.cvLink != null && aboutMe.cvLink!.isNotEmpty;

                final socialPills = Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: aboutMe.socialPills.map((socialPill) {
                    final socialPlatform =
                        SocialPlatform.fromString(socialPill.name);
                    final isX = socialPlatform == SocialPlatform.x ||
                        socialPlatform == SocialPlatform.twitter;
                    final iconSize = isX ? 16.0 : 18.0;
                    return SocialPill(
                      iconWidget: socialPlatform != null
                          ? SvgPicture.asset(
                              socialPlatform.assetPath,
                              height: iconSize,
                              width: iconSize,
                            )
                          : Icon(Icons.link, size: iconSize),
                      label: socialPill.name,
                      onTap: () => _handleSocialPillClick(
                        socialPill.name,
                        socialPill.url,
                      ),
                    );
                  }).toList(),
                );

                if (context.isSmallScreen && showCv) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      socialPills,
                      gap8,
                      SocialPill(
                        iconWidget: const Icon(Icons.download, size: 18),
                        label: 'Download CV',
                        onTap: () => _handleCVDownload(aboutMe.cvLink!),
                      ),
                    ],
                  );
                }
                return Row(
                  children: [
                    socialPills,
                    if (showCv)
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SocialPill(
                            iconWidget: const Icon(Icons.download, size: 18),
                            label: 'Download CV',
                            onTap: () => _handleCVDownload(aboutMe.cvLink!),
                          ),
                        ),
                      ),
                  ],
                );
              },
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

                return GridView.count(
                  crossAxisCount: context.isSmallScreen
                      ? 1
                      : maxWidth < 550
                          ? 1
                          : 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: context.isSmallScreen ? 4.5 : 6,
                  padding: allPadding4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ...aboutMe.professionalSkills.map(
                      (skill) => GridItem(
                        icon: Icons.code,
                        iconStyle: IconStyle(
                          color: Colors.white,
                          size: context.isSmallScreen ? 24 : 32,
                        ),
                        title: skill,
                        subtitle: 'Professional Skill',
                      ),
                    ),
                    ...aboutMe.personalInterests.map(
                      (interest) => GridItem(
                        icon: Icons.favorite,
                        iconStyle: IconStyle(
                          color: Colors.white,
                          size: context.isSmallScreen ? 24 : 32,
                        ),
                        title: interest,
                        subtitle: 'Personal Interest',
                      ),
                    ),
                  ],
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
