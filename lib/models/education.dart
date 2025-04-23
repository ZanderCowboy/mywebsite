class Education {
  Education({
    required this.schoolName,
    required this.degree,
    required this.endDate,
    required this.description,
    this.fieldOfStudy,
    this.startDate,
    this.imageUrl,
    this.link,
  });

  final String? schoolName;
  final String? degree;
  final String? fieldOfStudy;
  final String? startDate;
  final String? endDate;
  final String? description;
  final String? imageUrl;
  final String? link;
}
