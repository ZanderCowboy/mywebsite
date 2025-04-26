import 'package:mywebsite/models/experience.dart';

const companyUrl =
    'https://static.vecteezy.com/system/resources/previews/022/782/608/large_2x/url-letter-logo-design-in-illustration-logo-calligraphy-designs-for-logo-poster-invitation-etc-vector.jpg';

List<Experience> get experiences => _experiences;

List<Experience> _experiences = [
  Experience(
    role: 'Software Engineer',
    company: 'Rank Interactive',
    location: 'Cape Town, South Africa',
    language: 'Flutter, Dart',
    startDate: DateTime(2023, 9),
    responsibilities: [
      'List',
    ],
    companyImageUrl:
        'https://media.licdn.com/dms/image/v2/D4E0BAQE7CA_wNexIcg/company-logo_200_200/company-logo_200_200/0/1688987950673/rank_interactive_logo?e=1750896000&v=beta&t=lt5EYb6b73csGSMWhc2b3__3SLMmQAfjoPtx1pmzijI',
  ),
  Experience(
    role: 'Java Developer Intern',
    company: 'redPanda Software',
    location: 'Mowbray, Cape Town',
    language: 'Java',
    startDate: DateTime(2023, 4),
    endDate: DateTime(2023, 8),
    responsibilities: [
      'List',
    ],
    companyImageUrl:
        'https://www.redpandasoftware.co.za/wp-content/uploads/2024/03/redpanda-logo_transparent.png',
  ),
];
