import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/profile/profile_item.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: kPrimaryColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: allPadding24,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                flightShuttleBuilder: (
                  flightContext,
                  animation,
                  flightDirection,
                  fromHeroContext,
                  toHeroContext,
                ) {
                  return FadeTransition(
                    opacity: animation,
                    child: ClipOval(
                      child: Image.asset(
                        Assets.images.profile.profile2Png.path,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                tag: 'profile',
                child: ClipOval(
                  child: Image.asset(
                    Assets.images.profile.profile2Png.path,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              gap18,
              const Text(
                'Zander Kotze',
                style: PersonalText.header,
              ),
              gap18,
              const Card(
                color: kSecondaryColor,
                child: Padding(
                  padding: EdgeInsets.all(8),
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
              const SizedBox(
                width: 225,
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
                    icon: Icons.email,
                    header: 'EMAIL',
                    description: 'zanderkotze99@gmail.com',
                  ),
                  gap18,
                  ProfileItem(
                    icon: Icons.phone,
                    header: 'PHONE',
                    description: '+27 79 747 4086',
                  ),
                  gap18,
                  ProfileItem(
                    icon: Icons.calendar_month,
                    header: 'BIRTHDAY',
                    description: '14 September 1999',
                  ),
                  gap18,
                  ProfileItem(
                    icon: Icons.location_city,
                    header: 'LOCATION',
                    description: 'Cape Town, South Africa',
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
