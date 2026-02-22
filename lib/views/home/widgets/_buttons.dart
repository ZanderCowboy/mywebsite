part of '../home_page.dart';

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    final analyticsService = AnalyticsService();
    return Padding(
      padding: allPadding10,
      child: Container(
        padding: allPadding10,
        decoration: BoxDecoration(
          color: Colors.transparent.withValues(alpha: 0.35),
          border: Border.all(
            color: const Color(0x44748B97),
            width: 2,
          ),
          borderRadius: borderRadius10,
        ),
        child: Column(
          children: [
            LinkButton(
              buttonText: 'Personal Website',
              onPressed: () {
                analyticsService.logEvent(
                  AnalyticsEvent.navigateToPersonal,
                  parameters: Parameters(source: 'home_button'),
                );
                Navigator.pushNamed(context, kPersonalPageRoute);
              },
              backgroundColor: personalWebsiteColor,
              buttonImage: Assets.images.home.rocketLaunch.path,
            ),
            sizedBox,
            LinkButton(
              buttonText: SocialPlatform.linkedin.name,
              link: SocialPlatform.linkedin.url,
              backgroundColor: SocialPlatform.linkedin.color,
              buttonImage: SocialPlatform.linkedin.assetPath,
            ),
            sizedBox,
            LinkButton(
              buttonText: SocialPlatform.github.name,
              link: SocialPlatform.github.url,
              backgroundColor: SocialPlatform.github.color,
              buttonImage: SocialPlatform.github.assetPath,
            ),
            sizedBox,
            LinkButton(
              buttonText: SocialPlatform.x.name,
              link: SocialPlatform.x.url,
              backgroundColor: SocialPlatform.x.color,
              buttonImage: SocialPlatform.x.assetPath,
            ),
            sizedBox,
            DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFFFFD600),
                    Color(0xFFFF7A00),
                    Color(0xFFFF0069),
                    Color(0xFFD300C5),
                    Color(0xFF7638FA),
                  ],
                ),
              ),
              child: LinkButton(
                buttonText: SocialPlatform.instagram.name,
                link: SocialPlatform.instagram.url,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  disabledForegroundColor:
                      Colors.transparent.withValues(alpha: 0.38),
                  disabledBackgroundColor:
                      Colors.transparent.withValues(alpha: 0.12),
                  shadowColor: Colors.transparent,
                ),
                buttonImage: SocialPlatform.instagram.assetPath,
              ),
            ),
            sizedBox,
            LinkButton(
              buttonText: SocialPlatform.youtube.name,
              link: SocialPlatform.youtube.url,
              backgroundColor: SocialPlatform.youtube.color,
              buttonImage: SocialPlatform.youtube.assetPath,
            ),
            sizedBox,
            LinkButton(
              buttonText: SocialPlatform.discord.name,
              link: SocialPlatform.discord.url,
              backgroundColor: SocialPlatform.discord.color,
              buttonImage: SocialPlatform.discord.assetPath,
            ),
          ],
        ),
      ),
    );
  }
}
