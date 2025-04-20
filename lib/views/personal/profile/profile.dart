// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mywebsite/util/ui_constants.dart';
import 'package:mywebsite/views/personal/profile/profile_item.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF1E1E1F),
      child: SingleChildScrollView(
        child: Padding(
          padding: allPadding24,
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://www.pngitem.com/pimgs/m/272-2720656_user-profile-dummy-hd-png-download.png',
                ),
              ),
              height18,
              Text(
                'Zander Kotze',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              height18,
              Card(
                color: Color(0xFF2B2B2C),
                child: Padding(
                  padding: const EdgeInsets.all(8),
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
                      Text(
                        'Open Source Contributor',
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
                    icon: Icons.email,
                    header: 'EMAIL',
                    description: 'zanderkotze99@gmail.com',
                  ),
                  height18,
                  ProfileItem(
                    icon: Icons.phone,
                    header: 'PHONE',
                    description: '+27 79 747 4086',
                  ),
                  height18,
                  ProfileItem(
                    icon: Icons.calendar_month,
                    header: 'BIRTHDAY',
                    description: '14 September 1999',
                  ),
                  height18,
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
