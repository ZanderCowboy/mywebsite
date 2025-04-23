import 'package:mywebsite/models/project.dart';

const projects = [
  Project(
    name: 'Page Buddy',
    tools: ['React', 'TypeScript', 'Gleam', 'SQL', 'AI'],
    description:
        'A word processor with everything you would expect from a WYSIWYG editor along with a novel drag and drop user interface and a powerful style/theme engine. Features rich accessibility tools including an embedded neural network for auto-complete.',
    repoLink: 'https://github.com/yourusername/pagebuddy',
    imageUrl:
        'https://static.vecteezy.com/system/resources/previews/008/998/006/original/url-logo-url-letter-url-letter-logo-design-initials-url-logo-linked-with-circle-and-uppercase-monogram-logo-url-typography-for-technology-business-and-real-estate-brand-vector.jpg',
    isNetworkImage: true,
  ),
  Project(
    name: 'Brutalism Design System',
    tools: ['Flutter', 'Dart', 'Material Design'],
    description:
        'A raw, monumental post-war design system for Flutter applications. '
        'Implements brutalist design principles with a modern twist, featuring '
        'bold typography, raw materials, and modular components.',
    repoLink: 'https://github.com/yourusername/brutalism',
    imageUrl:
        'https://images.unsplash.com/photo-1517423568366-8b83523034fd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
    isNetworkImage: true,
  ),
  Project(
    name: 'AI Code Assistant',
    tools: ['Python', 'PyTorch', 'Transformers', 'FastAPI'],
    description:
        'An intelligent code completion and suggestion tool powered by '
        'state-of-the-art transformer models. Features real-time code analysis,'
        ' context-aware suggestions, and support for multiple programming '
        'languages.',
    repoLink: 'https://github.com/yourusername/ai-code-assistant',
    imageUrl: 'assets/images/placeholder.png',
  ),
  Project(
    name: 'Eco Track',
    tools: ['React Native', 'Node.js', 'MongoDB', 'AWS'],
    description:
        'A mobile application for tracking personal carbon footprint. Users '
        'can log daily activities, receive eco-friendly suggestions, and '
        'connect with like-minded individuals to share sustainability tips.',
    repoLink: 'https://github.com/yourusername/eco-track',
    imageUrl:
        'https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
    isNetworkImage: true,
  ),
];
