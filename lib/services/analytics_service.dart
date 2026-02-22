import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:mywebsite/models/parameters.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for handling Firebase Analytics throughout the app
class AnalyticsService {
  factory AnalyticsService() {
    return _instance;
  }
  AnalyticsService._internal();
  static final AnalyticsService _instance = AnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  FirebaseAnalytics get analytics => _analytics;

  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> logEvent(
    AnalyticsEvent event, {
    Parameters? parameters,
  }) async {
    var json = <String, dynamic>{};

    if (parameters != null) {
      json = parameters.toJson()..removeWhere((key, value) => value == null);
    }

    await _logEvent(event.eventName, parameters: json);
  }

  Future<void> logCustomEvent(
    String eventName, {
    Map<String, dynamic>? parameters,
  }) async {
    await _logEvent(eventName, parameters: parameters);
  }

  Future<void> trackAppOpen() async {
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();

    await _logEvent(
      AnalyticsEvent.appOpened.eventName,
      parameters: {
        'timestamp': now.toIso8601String(),
        'date': now.toIso8601String().split('T')[0], // YYYY-MM-DD
        'time':
            '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
        'day_of_week': _getDayOfWeek(now.weekday),
        'hour_of_day': now.hour,
        'timezone': now.timeZoneName,
        'is_weekend': (now.weekday >= 6).toString(),
      },
    );

    const firstVisitKey = 'analytics_first_visit';
    final hasVisitedBefore = prefs.getBool(firstVisitKey) ?? false;

    if (!hasVisitedBefore) {
      await _logEvent(
        AnalyticsEvent.firstVisit.eventName,
        parameters: {
          'first_visit_timestamp': now.toIso8601String(),
          'first_visit_date': now.toIso8601String().split('T')[0],
          'first_visit_time':
              '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
          'first_visit_day_of_week': _getDayOfWeek(now.weekday),
          'first_visit_hour_of_day': now.hour,
          'first_visit_timezone': now.timeZoneName,
          'first_visit_is_weekend': (now.weekday >= 6).toString(),
        },
      );

      await prefs.setBool(firstVisitKey, true);

      // Also set the first visit timestamp for future reference
      await prefs.setString('first_visit_timestamp', now.toIso8601String());
    } else {
      // Get the original first visit timestamp for returning users
      final firstVisitTimestamp = prefs.getString('first_visit_timestamp');
      if (firstVisitTimestamp != null) {
        final firstVisit = DateTime.parse(firstVisitTimestamp);
        final daysSinceFirstVisit = now.difference(firstVisit).inDays;

        await _logEvent(
          AnalyticsEvent.appOpened.eventName,
          parameters: {
            'is_returning_user': 'true',
            'days_since_first_visit': daysSinceFirstVisit,
            'first_visit_date': firstVisit.toIso8601String().split('T')[0],
          },
        );
      }
    }
  }

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

  Future<void> setUserProperties({
    String? userType,
    String? preferredTheme,
    String? deviceType,
    String? primaryLanguage,
  }) async {
    if (userType != null) {
      await _analytics.setUserProperty(
        name: 'user_type',
        value: userType,
      );
    }
    if (preferredTheme != null) {
      await _analytics.setUserProperty(
        name: 'preferred_theme',
        value: preferredTheme,
      );
    }
    if (deviceType != null) {
      await _analytics.setUserProperty(
        name: 'device_type',
        value: deviceType,
      );
    }
    if (primaryLanguage != null) {
      await _analytics.setUserProperty(
        name: 'primary_language',
        value: primaryLanguage,
      );
    }
  }

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
