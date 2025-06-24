import 'package:flutter/material.dart';

enum ProfileItemType {
  email(
    icon: Icons.email,
    header: 'EMAIL',
    description: 'zanderkotze99@gmail.com',
  ),
  phone(
    icon: Icons.phone,
    header: 'PHONE',
    description: '+27 79 747 4086',
  ),
  birthday(
    icon: Icons.calendar_month,
    header: 'BIRTHDAY',
    description: '14 September 1999',
  ),
  location(
    icon: Icons.location_city,
    header: 'LOCATION',
    description: 'Cape Town, South Africa',
  );

  const ProfileItemType({
    required this.icon,
    required this.header,
    required this.description,
  });

  final IconData icon;
  final String header;
  final String description;
}
