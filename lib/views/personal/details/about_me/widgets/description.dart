part of '../about_me.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final useSplit = AllData
            .instance.featureFlags[RemoteConfigFeatureFlags.aboutMeUseSplit] ??
        false;

    final aboutMe = AllData.instance.aboutMe;

    if (aboutMe == null) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final useTwoColumns = useSplit &&
            constraints.maxWidth >= 550 &&
            (aboutMe.ongoingProjectsText != null &&
                aboutMe.ongoingProjectsText!.isNotEmpty);

        if (useTwoColumns) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  aboutMe.description,
                  style: Typo.body,
                ),
              ),
              gap16,
              Expanded(
                child: Text(
                  aboutMe.ongoingProjectsText!,
                  style: Typo.body,
                ),
              ),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              aboutMe.description,
              style: Typo.body,
            ),
            if (aboutMe.ongoingProjectsText != null &&
                aboutMe.ongoingProjectsText!.isNotEmpty) ...[
              gap16,
              Text(
                aboutMe.ongoingProjectsText!,
                style: Typo.body,
              ),
            ],
          ],
        );
      },
    );
  }
}
