import 'package:mywebsite/models/experience.dart';

const companyUrl =
    'https://static.vecteezy.com/system/resources/previews/022/782/608/large_2x/url-letter-logo-design-in-illustration-logo-calligraphy-designs-for-logo-poster-invitation-etc-vector.jpg';

List<Experience> get experiences => _experiences;

List<Experience> _experiences = [
  Experience(
    role: 'Senior Software Engineer',
    company: 'Tech Corp',
    location: 'San Francisco, CA',
    language: 'Dart, Flutter',
    startDate: DateTime(2022),
    responsibilities: [
      'Led the development of cross-platform mobile applications',
      'Implemented complex UI components and animations',
      'Mentored junior developers and conducted code reviews',
    ],
    companyImageUrl: companyUrl,
  ),
  Experience(
    role: 'Software Engineer',
    company: 'Startup Inc',
    location: 'New York, NY',
    language: 'JavaScript, React',
    startDate: DateTime(2020, 6),
    endDate: DateTime(2021, 12),
    responsibilities: [
      'Developed and maintained web applications',
      'Implemented RESTful APIs',
      'Optimized application performance',
    ],
    companyImageUrl: companyUrl,
  ),
  Experience(
    role: 'Software Engineer 2',
    company: 'Startup Inc',
    location: 'New York, NY',
    language: 'JavaScript, React',
    startDate: DateTime(2020, 6),
    endDate: DateTime(2021, 12),
    responsibilities: [
      'Developed and maintained web applications',
      'Implemented RESTful APIs',
      'Optimized application performance',
    ],
    companyImageUrl: companyUrl,
  ),
  Experience(
    role: 'Software Engineer 1',
    company: 'Startup Inc',
    location: 'New York, NY',
    language: 'JavaScript, React',
    startDate: DateTime(2020, 6),
    endDate: DateTime(2021, 12),
    responsibilities: [
      'Developed and maintained web applications',
      'Implemented RESTful APIs',
      'Optimized application performance',
    ],
    companyImageUrl: companyUrl,
  ),
];
