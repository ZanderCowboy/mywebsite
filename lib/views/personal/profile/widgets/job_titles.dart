part of '../profile.dart';

class JobTitles extends StatelessWidget {
  const JobTitles({
    required this.titles,
    super.key,
  });

  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    var titlesCopy = titles;

    if (titles.isEmpty) {
      titlesCopy = ['No job title'];
    }

    return Card(
      color: kSecondaryColor,
      child: Padding(
        padding: horizontal40 + vertical16,
        child: Column(
          children: [
            ...List.generate(
              titlesCopy.length,
              (index) {
                return Text(
                  titlesCopy[index],
                  style: Typo.subtitle.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
