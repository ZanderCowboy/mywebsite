import 'package:mywebsite/models/education.dart';

List<Education> get educations => _educations;

List<Education> _educations = [
  Education(
    schoolName: 'University of Technology',
    degree: 'Bachelor of Computer Science',
    endDate: '2023',
    description:
        'Specialized in software development and artificial intelligence. '
        'Graduated with honors.',
    imageUrl: 'https://via.placeholder.com/150',
    link: 'https://example.com/degree1',
  ),
  Education(
    schoolName: 'Tech Institute',
    degree: 'Master of Data Science',
    endDate: '2021',
    description:
        'Focused on machine learning and big data analytics. Completed thesis '
        'on neural networks.',
    imageUrl: 'https://via.placeholder.com/150',
    link: 'https://example.com/degree2',
  ),
  Education(
    schoolName: 'Coding Academy',
    degree: 'Advanced Web Development',
    endDate: '2020',
    description:
        'Intensive program covering modern web technologies and frameworks.',
    imageUrl: 'https://via.placeholder.com/150',
    link: 'https://example.com/degree3',
  ),
  Education(
    schoolName: 'Digital University',
    degree: 'Cybersecurity Certification',
    endDate: '2019',
    description:
        'Comprehensive training in network security and ethical hacking.',
    imageUrl: 'https://via.placeholder.com/150',
    link: 'https://example.com/degree4',
  ),
];
