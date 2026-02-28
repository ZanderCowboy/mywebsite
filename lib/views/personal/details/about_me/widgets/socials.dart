part of '../about_me.dart';

class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutMe = AllData.instance.aboutMe;

    if (aboutMe == null) {
      return const SizedBox.shrink();
    }

    return Builder(
      builder: (context) {
        final showCv = aboutMe.cvLink != null && aboutMe.cvLink!.isNotEmpty;

        final socialPills = Wrap(
          spacing: 16,
          runSpacing: 8,
          children: aboutMe.socialPills.map((socialPill) {
            final socialPlatform = SocialPlatform.fromString(socialPill.name);
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
    );
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
}
