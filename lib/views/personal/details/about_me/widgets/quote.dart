part of '../about_me.dart';

class Quote extends StatelessWidget {
  const Quote({super.key});

  @override
  Widget build(BuildContext context) {
    final showQuote = AllData
            .instance.featureFlags[RemoteConfigFeatureFlags.aboutMeShowQuote] ??
        false;

    final aboutMe = AllData.instance.aboutMe;

    if (aboutMe == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        if (showQuote &&
            aboutMe.quote != null &&
            aboutMe.quote!.isNotEmpty) ...[
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
      ],
    );
  }
}
