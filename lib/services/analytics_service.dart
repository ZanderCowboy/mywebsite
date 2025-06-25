import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for handling Firebase Analytics throughout the app
class AnalyticsService {
  factory AnalyticsService() {
    return _instance;
  }
  AnalyticsService._internal();
  static final AnalyticsService _instance = AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Get the Firebase Analytics instance
  FirebaseAnalytics get analytics => _analytics;

  /// Get the Firebase Analytics Observer for navigation tracking
  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  /// Generic method to log any analytics event
  Future<void> logEvent(
    AnalyticsEvent event, {
    Map<String, dynamic>? parameters,
  }) async {
    await _logEvent(event.eventName, parameters: parameters);
  }

  /// Log custom events with string event names (for events not in the enum)
  Future<void> logCustomEvent(
    String eventName, {
    Map<String, dynamic>? parameters,
  }) async {
    await _logEvent(eventName, parameters: parameters);
  }

  /// Track app opening and first visit with date/time data
  Future<void> trackAppOpen() async {
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();

    // Always log app opened
    await logEvent(
      AnalyticsEvent.appOpened,
      parameters: {
        'timestamp': now.toIso8601String(),
        'date': now.toIso8601String().split('T')[0], // YYYY-MM-DD
        'time':
            '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
        'day_of_week': _getDayOfWeek(now.weekday),
        'hour_of_day': now.hour,
        'timezone': now.timeZoneName,
        'is_weekend': now.weekday >= 6,
      },
    );

    // Check if this is the first visit
    const firstVisitKey = 'analytics_first_visit';
    final hasVisitedBefore = prefs.getBool(firstVisitKey) ?? false;

    if (!hasVisitedBefore) {
      // Log first visit
      await logEvent(
        AnalyticsEvent.firstVisit,
        parameters: {
          'first_visit_timestamp': now.toIso8601String(),
          'first_visit_date': now.toIso8601String().split('T')[0],
          'first_visit_time':
              '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
          'first_visit_day_of_week': _getDayOfWeek(now.weekday),
          'first_visit_hour_of_day': now.hour,
          'first_visit_timezone': now.timeZoneName,
          'first_visit_is_weekend': now.weekday >= 6,
        },
      );

      // Mark as visited
      await prefs.setBool(firstVisitKey, true);

      // Also set the first visit timestamp for future reference
      await prefs.setString('first_visit_timestamp', now.toIso8601String());
    } else {
      // Get the original first visit timestamp for returning users
      final firstVisitTimestamp = prefs.getString('first_visit_timestamp');
      if (firstVisitTimestamp != null) {
        final firstVisit = DateTime.parse(firstVisitTimestamp);
        final daysSinceFirstVisit = now.difference(firstVisit).inDays;

        // Add returning user context to app opened event
        await logEvent(
          AnalyticsEvent.appOpened,
          parameters: {
            'is_returning_user': true,
            'days_since_first_visit': daysSinceFirstVisit,
            'first_visit_date': firstVisit.toIso8601String().split('T')[0],
          },
        );
      }
    }
  }

  /// Helper method to convert weekday number to string
  String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Unknown';
    }
  }

  /// Set user properties for better analytics segmentation
  Future<void> setUserProperties({
    String? userType,
    String? preferredTheme,
    String? deviceType,
    String? primaryLanguage,
  }) async {
    if (userType != null) {
      await _analytics.setUserProperty(name: 'user_type', value: userType);
    }
    if (preferredTheme != null) {
      await _analytics.setUserProperty(
        name: 'preferred_theme',
        value: preferredTheme,
      );
    }
    if (deviceType != null) {
      await _analytics.setUserProperty(name: 'device_type', value: deviceType);
    }
    if (primaryLanguage != null) {
      await _analytics.setUserProperty(
        name: 'primary_language',
        value: primaryLanguage,
      );
    }
  }

  /// Set user ID for analytics (if you have user authentication)
  Future<void> setUserId(String userId) async {
    try {
      await _analytics.setUserId(id: userId);
    } catch (e) {
      if (kDebugMode) {
        print('Error setting user ID: $e');
      }
    }
  }

  /// Reset analytics data (useful for logout scenarios)
  Future<void> resetAnalyticsData() async {
    try {
      await _analytics.resetAnalyticsData();
    } catch (e) {
      if (kDebugMode) {
        print('Error resetting analytics data: $e');
      }
    }
  }

  /// Private method to handle all event logging with error handling
  Future<void> _logEvent(
    String eventName, {
    Map<String, dynamic>? parameters,
  }) async {
    try {
      if (kDebugMode) {
        print(
          'Analytics Event: $eventName ${parameters != null ? 'with parameters: $parameters' : ''}',
        );
      }

      await _analytics.logEvent(
        name: eventName,
        parameters: parameters?.cast<String, Object>(),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error logging analytics event $eventName: $e');
      }
    }
  }
}
