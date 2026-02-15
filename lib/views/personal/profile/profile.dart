import 'package:flutter/material.dart';
import 'package:mywebsite/components/hero_widget.dart';
import 'package:mywebsite/models/enums/profile_item_type.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/profile/profile_item.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Text(
                        'Software Engineer',
                        style: Typo.subtitle.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Flutter Developer',
                        style: Typo.subtitle.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileItem(
                    type: ProfileItemType.email,
                  ),
                  gap18,
                  ProfileItem(
                    type: ProfileItemType.phone,
                  ),
                  gap18,
                  ProfileItem(
                    type: ProfileItemType.birthday,
                  ),
                  gap18,
                  ProfileItem(
                    type: ProfileItemType.location,
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
