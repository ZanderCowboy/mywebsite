class Experience {
  Experience({
    required this.role,
    required this.company,
    required this.location,
    required this.language,
    required this.startDate,
    required this.responsibilities,
    this.endDate,
    this.companyImageUrl,
  });

  final String role;
  final String company;
  final String location;
  final String language;
  final DateTime startDate;
  final DateTime? endDate;
  final List<String> responsibilities;
  final String? companyImageUrl;

  String get duration {
    if (endDate == null) {
      return '${startDate.year} - Present';
    }
    return '${startDate.year} - ${endDate!.year}';
  }
}
