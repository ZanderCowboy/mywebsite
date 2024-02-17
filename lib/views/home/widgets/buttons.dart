part of '../home_page.dart';

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.1).withAlpha(1100),
        border: Border.all(
            color: const Color(0x44748B97),
            width: 2.0,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            width: LinkButton.width,
            height: LinkButton.height,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, personalPageRoute),
              style: ElevatedButton.styleFrom(
                backgroundColor: personalWebsiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    personalWebsiteImage,
                    height: LinkButton.imageHeight,
                  ),
                  width8,
                  Text(
                    'Personal Website',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: LinkButton.fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          sizedBox,
          const LinkButton(
            text: 'LinkedIn',
            link: linkedInURL,
            color: linkedInColor,
            image: linkedInImage,
          ),
          sizedBox,
          const LinkButton(
            text: 'Twitter',
            link: twitterURL,
            color: twitterColor,
            image: twitterImage,
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                fixedSize: const Size(320, 50),
                disabledForegroundColor: Colors.transparent.withOpacity(0.38),
                disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                shadowColor: Colors.transparent,
              ),
              onPressed: () => launchURL(instagramURL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "images/instagram/icons8-instagram-384.svg",
                    width: 25,
                  ),
                  width8,
                  const Text(
                    'Instagram',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          sizedBox,
          const LinkButton(
            text: 'GitHub',
            link: githubURL,
            color: githubColor,
            image: githubImage,
          ),
          sizedBox,
          const LinkButton(
            text: 'YouTube',
            link: youtubeURL,
            color: youtubeColor,
            image: youtubeImage,
          ),
          sizedBox,
          const LinkButton(
            text: 'Discord',
            link: discordURL,
            color: discordColor,
            image: discordImage,
          ),
        ],
      ),
    );
  }
}
