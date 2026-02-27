import 'package:flutter/material.dart';
import 'package:mywebsite/bootstrap.dart';
import 'package:mywebsite/components/background_image.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/views/home/home_page.dart';
import 'package:mywebsite/views/personal/personal_page.dart';

/// Root page that manages background image persistence and page content switching.
/// This prevents reloading the background image when navigating between pages.
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentPageIndex = 0;

  void _navigateToPage(int pageIndex) {
    if (_currentPageIndex != pageIndex) {
      setState(() {
        _currentPageIndex = pageIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundImageUrl = globalAppImages?.backgroundImageUrl;
    final fallbackImagePath = Assets.images.homePageBackground.path;

    return BackgroundImage(
      imageUrl: backgroundImageUrl ?? fallbackImagePath,
      isPositioned: false,
      fallbackImage: Center(
        child: Image.asset(fallbackImagePath),
      ),
      child: _PageContent(
        currentPageIndex: _currentPageIndex,
        onNavigate: _navigateToPage,
      ),
    );
  }
}

/// Manages the content display between pages.
class _PageContent extends StatelessWidget {
  const _PageContent({
    required this.currentPageIndex,
    required this.onNavigate,
  });

  final int currentPageIndex;
  final void Function(int) onNavigate;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentPageIndex,
      children: [
        // Home Page (index 0)
        HomePage(onNavigateToPersonal: () => onNavigate(1)),
        // Personal Page (index 1)
        PersonalPage(onNavigateToHome: () => onNavigate(0)),
      ],
    );
  }
}
