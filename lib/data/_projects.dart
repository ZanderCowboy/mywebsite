part of 'all_data.dart';

List<Project> _projects = [
  const Project(
    name: 'Multichoice',
    tools: ['Flutter', 'Dart', 'GitHub Actions'],
    description:
        'A versatile Flutter application that helps users manage and organize their choices across different categories. '
        'Built with modern Flutter architecture and following best practices, it provides an intuitive interface for '
        'creating, editing, and managing multiple choice items. Features include search functionality, export/import '
        'capabilities, product tours, and a built-in feedback system.',
    repoLink: 'https://github.com/ZanderCowboy/multichoice',
    imageUrl:
        'https://raw.githubusercontent.com/ZanderCowboy/multichoice/f77702a07e8956fc7adfcd0af2cedf938645f017/apps/multichoice/app_icon/app_icon.svg',
    isNetworkImage: true,
  ),
  const Project(
    name: 'Verbose Adventure',
    tools: [
      'Python',
      'Java',
      'GRPC',
      'Flutter',
      'Dart',
    ],
    description:
        'A 3-way Propositional Logic Truth Table Generator that takes an input statement and returns a processed truth table. '
        'Built with a Python gRPC server engine for logic calculations, Java backend for processing, and Flutter frontend '
        'for user interface. Features include input validation, bracket checking, illegal character detection, and '
        'comprehensive propositional logic computation.',
    repoLink: 'https://github.com/ZanderCowboy/verbose-adventure',
    imageUrl:
        'https://images.unsplash.com/photo-1517423568366-8b83523034fd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
    isNetworkImage: true,
  ),
  const Project(
    name: 'My Website',
    tools: ['Flutter', 'Dart'],
    description:
        'A personal portfolio website showcasing my skills, projects, and experience. '
        'Built with Flutter for cross-platform compatibility, featuring a responsive '
        'design with animated components, social media integration, and a modern '
        'dark theme. Includes sections for about me, education, experience, '
        'projects, and skills.',
    repoLink: 'https://github.com/ZanderCowboy/mywebsite',
    imageUrl: 'assets/images/placeholder.png',
  ),
];
