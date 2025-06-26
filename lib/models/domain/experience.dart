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
    final startMonth = _getMonthName(startDate.month);
    final startYear = startDate.year;

    if (endDate == null) {
      return '$startMonth $startYear - Present';
    }

    final endMonth = _getMonthName(endDate!.month);
    final endYear = endDate!.year;
    return '$startMonth $startYear - $endMonth $endYear';
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
