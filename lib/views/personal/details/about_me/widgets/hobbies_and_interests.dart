part of '../about_me.dart';

class HobbiesAndInterests extends StatelessWidget {
  const HobbiesAndInterests({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutMe = AllData.instance.aboutMe;

    if (aboutMe == null) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return GridView.count(
          crossAxisCount: context.isSmallScreen || maxWidth < 750 ? 1 : 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: context.isSmallScreen ? 4.5 : 6,
          padding: allPadding4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ...aboutMe.professionalSkills.map(
              (skill) => GridItem(
                icon: Icons.code,
                iconStyle: IconStyle(
                  size: !context.isLargeScreen ? 24 : 32,
                ),
                title: skill,
                subtitle: 'Professional Skill',
              ),
            ),
            ...aboutMe.personalInterests.map(
              (interest) => GridItem(
                icon: Icons.favorite,
                iconStyle: IconStyle(
                  size: !context.isLargeScreen ? 24 : 32,
                ),
                title: interest,
                subtitle: 'Personal Interest',
              ),
            ),
          ],
        );
      },
    );
  }
}
