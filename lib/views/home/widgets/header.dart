part of '../home_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        height8,
        Padding(
          padding: allPadding4,
          child: Image.asset(
            'images/profile2.png',
            height: 250,
          ),
        ),
        const Text(
          'ZANDER KOTZE',
          style: TextStyle(
            fontFamily: 'Anton',
            fontSize: 55,
            color: Colors.white,
            letterSpacing: 1.5,
            wordSpacing: 6,
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 4,
          indent: 0.35 * screenWidth,
          endIndent: 0.35 * screenWidth,
        ),
        Padding(
          padding: allPadding8,
          child: SizedBox(
            width: 0.4 * screenWidth,
            child: Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Hi there! Here are a few of my links.',
                    textStyle: const TextStyle(
                      fontFamily: 'PoiretOne',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      wordSpacing: 1.5,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                    speed: const Duration(milliseconds: 90),
                  ),
                ],
                pause: const Duration(seconds: 5),
                totalRepeatCount: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
