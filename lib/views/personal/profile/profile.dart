import 'package:flutter/material.dart';
import 'package:mywebsite/components/body_divider.dart';
import 'package:mywebsite/components/hero_widget.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/profile_item_type.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/profile/widgets/profile_item.dart';

part 'widgets/job_titles.dart';

const _currentTitle = [
  'Software Engineer',
  'Flutter Developer',
];

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final data = AllData.instance.profileDetails;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius12,
      ),
      color: kPrimaryColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: allPadding24,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeroWidget(),
              gap18,
              const Text(
                'Zander Kotze',
                style: Typo.header,
              ),
              gap18,
              JobTitles(titles: data?.currentTitle ?? _currentTitle),
              const BodyDivider(
                color: Colors.white,
                width: 250,
                height: 60,
                thickness: 1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileItem(
                    type: ProfileItemType.email,
                    remoteData: data?.email,
                  ),
                  gap18,
                  ProfileItem(
                    type: ProfileItemType.phone,
                    remoteData: data?.phone,
                  ),
                  gap18,
                  ProfileItem(
                    type: ProfileItemType.birthday,
                    remoteData: data?.birthday,
                  ),
                  gap18,
                  ProfileItem(
                    type: ProfileItemType.location,
                    remoteData: data?.location,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
