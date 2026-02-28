import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/parameters.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/details.dart';
import 'package:mywebsite/views/personal/details/sections/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';
import 'package:mywebsite/views/personal/profile/profile.dart';
import 'package:responsive_framework/responsive_framework.dart';

part '_personal_page_mobile.dart';
part '_personal_page_web.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({
    required this.onNavigateToHome,
    super.key,
  });

  final VoidCallback onNavigateToHome;

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final AnalyticsService _analyticsService = AnalyticsService();
  final AllData _allData = AllData.instance;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _analyticsService.logEvent(AnalyticsEvent.personalPageView);
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      await _allData.initialize();
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Failed to load data. Please try again.';
        });
      }
    }
  }

  Future<void> _handleRetry() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    await _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              gap24,
              ElevatedButton(
                onPressed: _handleRetry,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile
        ? _PersonalPageMobile(
            analyticsService: _analyticsService,
            onNavigateToHome: widget.onNavigateToHome,
          )
        : _PersonalPageWeb(
            analyticsService: _analyticsService,
            onNavigateToHome: widget.onNavigateToHome,
          );
  }
}
