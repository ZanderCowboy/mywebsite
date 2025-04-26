class Skill {
  Skill({
    required this.name,
    required this.description,
    required this.level,
    required this.imageUrl,
    this.isNetworkImage = false,
  });

  final String name;
  final String description;
  final String level;
  final String imageUrl;
  final bool isNetworkImage;
}
