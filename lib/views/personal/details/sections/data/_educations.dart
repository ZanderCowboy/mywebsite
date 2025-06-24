// ignore_for_file: avoid_redundant_argument_values

import 'package:mywebsite/models/education.dart';

List<Education> get educations => _educations;

List<Education> _educations = [
  Education(
    schoolName: 'University of South Africa',
    degree: 'Bachelor of Science Honours in Mathematics',
    startDate: DateTime(2022, 1),
    description:
        'Specialized in software development and artificial intelligence. '
        'Graduated with honors.',
    imageUrl:
        'https://seeklogo.com/images/U/university-of-south-africa-logo-DFC6826F63-seeklogo.com.png',
    schoolUrl: 'https://www.unisa.ac.za/sites/corporate/default/',
  ),
  Education(
    schoolName: 'University of South Africa',
    degree: 'Bachelor of Science in Computer Science and Mathematics',
    startDate: DateTime(2018, 1),
    endDate: DateTime(2021, 12),
    description:
        'Focused on machine learning and big data analytics. Completed thesis '
        'on neural networks.',
    imageUrl:
        'https://seeklogo.com/images/U/university-of-south-africa-logo-DFC6826F63-seeklogo.com.png',
    schoolUrl: 'https://www.unisa.ac.za/sites/corporate/default/',
  ),
  Education(
    schoolName: 'Hyperion Development',
    degree: 'Software Engineering Bootcamp',
    startDate: DateTime(2019, 11),
    endDate: DateTime(2020, 5),
    description:
        'Description of the bootcamp program, including languages and frameworks',
    imageUrl: 'https://www.hyperiondev.com/static/images/logo.svg',
    link: 'https://www.hyperiondev.com/portfolio/36117/',
    schoolUrl: 'https://www.hyperiondev.com/',
  ),
  Education(
    schoolName: 'Fichardt Park High School',
    degree: 'National Senior Certificate',
    endDate: DateTime(2017, 12),
    description: 'High school',
    imageUrl: 'https://fpark.co.za/wp-content/uploads/2024/01/ll.webp',
    schoolUrl: 'https://fpark.co.za/',
  ),
];
