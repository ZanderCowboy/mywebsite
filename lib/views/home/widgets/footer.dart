part of '../home_page.dart';

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 35, 0, 5),
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
          alignment: Alignment.bottomCenter,
          color: Colors.transparent,
          width: MediaQuery.sizeOf(context).width,
          child: const Copyright(),
        ),
      ],
    );
  }
}
