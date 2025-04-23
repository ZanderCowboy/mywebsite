class AboutMe {
  const AboutMe({
    required this.name,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.socialLinks,
    required this.skills,
    required this.interests,
  });

  final String name;
  final String title;
  final String description;
  final String imageUrl;
  final Map<String, String> socialLinks;
  final List<String> skills;
  final List<String> interests;
}
