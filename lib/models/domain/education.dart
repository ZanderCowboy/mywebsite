class Education {
  Education({
    required this.schoolName,
    required this.degree,
    required this.description,
    required this.startDate,
    this.endDate,
    this.fieldOfStudy,
    this.imageUrl,
    this.link,
    this.schoolUrl,
  });

  final String schoolName;
  final String degree;
  final String description;
  final String? fieldOfStudy;
  final DateTime startDate;
  final DateTime? endDate;
  final String? imageUrl;
  final String? link;
  final String? schoolUrl;

  String get duration {
    if (endDate == null) {
      return '${startDate.year} - Present';
    }
    return '${startDate.year} - ${endDate?.year}';
  }
}
