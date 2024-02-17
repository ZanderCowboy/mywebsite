part of '../home_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/profile2.png',
          height: 250,
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          'ZANDER KOTZE',
          style: TextStyle(
            fontFamily: 'Anton',
            fontSize: 55,
            color: Colors.white,
            letterSpacing: 1.5,
            wordSpacing: 6.0,
          ),
        ),
        SizedBox(
          width: 0.3 * MediaQuery.sizeOf(context).width,
          child: const Divider(
            color: Colors.white,
            thickness: 4,
            indent: 5,
            endIndent: 5,
          ),
        ),
        height8,
        SizedBox(
          width: 0.4 * MediaQuery.sizeOf(context).width,
          child: Wrap(
            children: [
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Oh! Hi there! Here are a few of my links.',
                      textStyle: const TextStyle(
                        fontFamily: 'PoiretOne',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        wordSpacing: 1.5,
                        letterSpacing: 1.0,
                      ),
                      speed: const Duration(milliseconds: 90),
                    ),
                  ],
                  pause: const Duration(seconds: 5),
                  totalRepeatCount: 2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
          width: 320,
        ),
      ],
    );
  }
}
