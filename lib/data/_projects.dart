part of 'all_data.dart';

List<Project> _projects = [
  const Project(
    name: 'Multichoice',
    tools: ['Flutter', 'Dart', 'GitHub Actions'],
    description:
        'A mobile application for tracking personal carbon footprint. Users '
        'can log daily activities, receive eco-friendly suggestions, and '
        'connect with like-minded individuals to share sustainability tips.',
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
        'A raw, monumental post-war design system for Flutter applications. '
        'Implements brutalist design principles with a modern twist, featuring '
        'bold typography, raw materials, and modular components.',
    repoLink: 'https://github.com/ZanderCowboy/verbose-adventure',
    imageUrl:
        'https://images.unsplash.com/photo-1517423568366-8b83523034fd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
    isNetworkImage: true,
  ),
  const Project(
    name: 'My Website',
    tools: ['Flutter', 'Dart'],
    description:
        'An intelligent code completion and suggestion tool powered by '
        'state-of-the-art transformer models. Features real-time code analysis,'
        ' context-aware suggestions, and support for multiple programming '
        'languages.',
    repoLink: 'https://github.com/ZanderCowboy/mywebsite',
    imageUrl: 'assets/images/placeholder.png',
  ),
];
