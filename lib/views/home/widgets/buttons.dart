part of '../home_page.dart';

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => Navigator.pushNamed(context, kPersonalPageRoute),
              backgroundColor: personalWebsiteColor,
              buttonImage: personalWebsiteImage,
            ),
            sizedBox,
            const LinkButton(
              buttonText: 'LinkedIn',
              link: linkedInURL,
              backgroundColor: linkedInColor,
              buttonImage: linkedInImage,
            ),
            sizedBox,
            const LinkButton(
              buttonText: 'Twitter',
              link: twitterURL,
              backgroundColor: twitterColor,
              buttonImage: twitterImage,
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
                buttonText: 'Instagram',
                link: instagramURL,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  disabledForegroundColor:
                      Colors.transparent.withValues(alpha: 0.38),
                  disabledBackgroundColor:
                      Colors.transparent.withValues(alpha: 0.12),
                  shadowColor: Colors.transparent,
                ),
                buttonImage: instagramImage,
              ),
            ),
            sizedBox,
            const LinkButton(
              buttonText: 'GitHub',
              link: githubURL,
              backgroundColor: githubColor,
              buttonImage: githubImage,
            ),
            sizedBox,
            const LinkButton(
              buttonText: 'YouTube',
              link: youtubeURL,
              backgroundColor: youtubeColor,
              buttonImage: youtubeImage,
            ),
            sizedBox,
            const LinkButton(
              buttonText: 'Discord',
              link: discordURL,
              backgroundColor: discordColor,
              buttonImage: discordImage,
            ),
          ],
        ),
      ),
    );
  }
}
