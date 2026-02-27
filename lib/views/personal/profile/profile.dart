import 'package:flutter/material.dart';
import 'package:mywebsite/components/hero_widget.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/profile_item_type.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/profile/profile_item.dart';

const _currentTitle = [
  'Software Engineer',
  'Flutter Developer',
];

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AllData.profileDetails,
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData || asyncSnapshot.hasError) {}

        final data = asyncSnapshot.data;

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
                  Card(
                    color: kSecondaryColor,
                    child: Padding(
                      padding: horizontal40 + vertical16,
                      child: Column(
                        children: [
                          ...List.generate(
                            data?.currentTitle.length ?? 2,
                            (index) {
                              return Text(
                                data?.currentTitle[index] ??
                                    _currentTitle[index],
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
                  ),
                  const SizedBox(
                    width: 250,
                    child: Divider(
                      height: 60,
                      color: Colors.white,
                      thickness: 1,
                    ),
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
      },
    );
  }
}
