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
      child: const SingleChildScrollView(
        child: Padding(
          padding: allPadding24,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeroWidget(),
              gap18,
              Text(
                'Zander Kotze',
                style: Typo.header,
              ),
              gap18,
              Card(
                color: kSecondaryColor,
                child: Padding(
                  padding: allPadding8,
                  child: Column(
                    children: [
                      Text(
                        'Software Engineer',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Flutter Developer',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 225,
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
