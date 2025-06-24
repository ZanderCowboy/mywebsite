class Project {
  const Project({
    required this.name,
    required this.tools,
    required this.description,
    required this.repoLink,
    this.imageUrl,
    this.isNetworkImage = false,
  });

  final String name;
  final List<String> tools;
  final String description;
  final String repoLink;

  /// The URL or path to the image associated with the project.
  final String? imageUrl;
  final bool isNetworkImage;
}
