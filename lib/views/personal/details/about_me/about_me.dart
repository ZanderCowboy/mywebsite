import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/components/export.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/export.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/parameters.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/shared/export.dart';

part 'widgets/description.dart';
part 'widgets/hobbies_and_interests.dart';
part 'widgets/quote.dart';
part 'widgets/socials.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({
    required this.flags,
    this.showHeader = true,
    this.wrapInScrollView = true,
    super.key,
  });

  final bool showHeader;
  final bool wrapInScrollView;
  final Map<RemoteConfigFeatureFlags, bool> flags;

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    final aboutMe = AllData.instance.aboutMe;

    if (aboutMe == null) {
      return const Center(
        child: Text('About me data is not available.'),
      );
    }

    final content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.showHeader) ...[
          const Text(
            'About Me',
            style: Typo.heading,
          ),
          BodyDivider(
            width: context.isMobile ? null : 80,
          ),
        ],
        const Quote(),
        const Description(),
        gap16,
        const Socials(),
        gap16,
        const Padding(
          padding: vertical12,
          child: Text(
            "What I'm doing",
            style: Typo.heading,
          ),
        ),
        const HobbiesAndInterests(),
      ],
    );

    if (widget.wrapInScrollView) {
      return SingleChildScrollView(child: content);
    }
    return content;
  }
}
