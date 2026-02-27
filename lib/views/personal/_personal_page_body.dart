part of 'personal_page.dart';

class _PersonalPageBody extends StatelessWidget {
  const _PersonalPageBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final backgroundImageUrl = globalAppImages?.backgroundImageUrl;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (backgroundImageUrl != null && backgroundImageUrl.isNotEmpty) ...[
          BackgroundImage(
            imageUrl: backgroundImageUrl,
            fallbackImage: Center(
              child: Image.asset(
                Assets.images.homePageBackground.path,
              ),
            ),
          ),
        ] else ...[
          BackgroundImage(
            imageUrl: homePageBackgroundUrl,
            fallbackImage: Center(
              child: Image.asset(
                Assets.images.homePageBackground.path,
              ),
            ),
          ),
        ],
        child,
      ],
    );
  }
}
