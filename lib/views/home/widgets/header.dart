part of '../home_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height24,
        Image.asset(
          'images/profile2.png',
          height: 250,
        ),
        height4,
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
        SizedBox(
          width: 0.3 * MediaQuery.sizeOf(context).width,
          child: const Divider(
            color: Colors.white,
            thickness: 4,
          ),
        ),
        height8,
        SizedBox(
          width: 0.4 * MediaQuery.sizeOf(context).width,
          child: Center(
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
        height40,
      ],
    );
  }
}
