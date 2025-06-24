part of '../profile_item.dart';

void _handleTap(ProfileItemType type) {
  switch (type) {
    case ProfileItemType.email:
      launchURL('mailto:${type.description}');
    case ProfileItemType.phone:
      launchURL('tel:${type.description}');
    case ProfileItemType.birthday:
      final date = _parseBirthday(type.description);
      if (date != null) {
        final formattedDate =
            '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
        final calendarUrl =
            'https://calendar.google.com/calendar/render?action=TEMPLATE&text=Zander%20Kotze%27s%20Birthday&dates=$formattedDate/$formattedDate';
        launchURL(calendarUrl);
      } else {}
    case ProfileItemType.location:
      final encodedLocation = Uri.encodeComponent(type.description);
      final mapsUrl = 'https://maps.google.com/?q=$encodedLocation';
      launchURL(mapsUrl);
  }
}

DateTime? _parseBirthday(String birthday) {
  try {
    final parts = birthday.split(' ');
    if (parts.length == 3) {
      final day = int.parse(parts[0]);
      final month = _getMonthNumber(parts[1]);
      final year = int.parse(parts[2]);
      return DateTime(year, month, day);
    }
  } catch (e) {
    return null;
  }
  return null;
}

int _getMonthNumber(String month) {
  const months = {
    'january': 1,
    'february': 2,
    'march': 3,
    'april': 4,
    'may': 5,
    'june': 6,
    'july': 7,
    'august': 8,
    'september': 9,
    'october': 10,
    'november': 11,
    'december': 12,
  };
  return months[month.toLowerCase()] ?? 1;
}
