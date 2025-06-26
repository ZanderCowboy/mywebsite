class AboutMeData {
  const AboutMeData({
    required this.description,
    required this.socialPills,
    required this.professionalSkills,
    required this.personalInterests,
  });

  final String description;
  final List<SocialPill> socialPills;
  final List<String> professionalSkills;
  final List<String> personalInterests;
}

class SocialPill {
  const SocialPill({
    required this.name,
    required this.url,
    required this.iconUrl,
  });

  final String name;
  final String url;
  final String iconUrl;
}
