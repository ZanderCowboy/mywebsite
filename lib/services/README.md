# AnalyticsService

A streamlined service for handling Firebase Analytics throughout the Flutter app using a generic approach with predefined events.

## Overview

The `AnalyticsService` is a singleton that wraps Firebase Analytics functionality and provides a simple, generic method for logging events using the `AnalyticsEvent` enum.

## Key Benefits

- **Reduced Code Size**: One generic method instead of 20+ individual methods
- **Type Safety**: Uses enum for event names to prevent typos
- **Flexibility**: Easy to add new events by adding to the enum
- **Consistency**: Standardized parameter approach across all events

## Usage

### Basic Setup

```dart
import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:mywebsite/services/analytics_service.dart';

final analyticsService = AnalyticsService();
```

### Logging Events

#### Simple Events (No Parameters)

```dart
// Log page views
await analyticsService.logEvent(AnalyticsEvent.homePageView);
await analyticsService.logEvent(AnalyticsEvent.personalPageView);
await analyticsService.logEvent(AnalyticsEvent.cvDownload);
await analyticsService.logEvent(AnalyticsEvent.avatarClick);
```

#### Events with Parameters

```dart
// Navigation events
await analyticsService.logEvent(
  AnalyticsEvent.navigateToPersonal,
  parameters: {'source': 'home_button'},
);

await analyticsService.logEvent(
  AnalyticsEvent.navigateToHome,
  parameters: {'source': 'personal_fab'},
);

// Social media clicks
await analyticsService.logEvent(
  AnalyticsEvent.socialMediaClick,
  parameters: {
    'platform': 'LinkedIn',
    'url': 'https://linkedin.com/in/yourprofile',
  },
);

// Contact events
await analyticsService.logEvent(
  AnalyticsEvent.emailClick,
  parameters: {'email_address': 'your@email.com'},
);

await analyticsService.logEvent(
  AnalyticsEvent.phoneClick,
  parameters: {'phone_number': '+1234567890'},
);

// Project interactions
await analyticsService.logEvent(
  AnalyticsEvent.projectClick,
  parameters: {
    'project_name': 'My Flutter App',
    'project_url': 'https://github.com/user/repo',
  },
);

// Skills and experience
await analyticsService.logEvent(
  AnalyticsEvent.skillClick,
  parameters: {'skill_name': 'Flutter'},
);

await analyticsService.logEvent(
  AnalyticsEvent.experienceView,
  parameters: {
    'company_name': 'Tech Corp',
    'position': 'Software Engineer',
  },
);

// Technical events
await analyticsService.logEvent(
  AnalyticsEvent.errorOccurred,
  parameters: {
    'error_message': 'Network timeout',
    'error_code': 'E001',
  },
);

await analyticsService.logEvent(
  AnalyticsEvent.performanceMetric,
  parameters: {
    'metric_name': 'page_load_time',
    'value': 2.5,
  },
);

// Engagement events
await analyticsService.logEvent(
  AnalyticsEvent.userEngagement,
  parameters: {
    'engagement_type': 'high_interest',
    'section': 'projects',
  },
);
```

### App Lifecycle Tracking

The service automatically tracks app opening and first visits:

```dart
// This is called automatically in main.dart, but you can also call it manually
await analyticsService.trackAppOpen();
```

This will log:

- **First Visit**: Only logged once per user with comprehensive date/time data
- **App Opened**: Logged every time the app starts with current date/time data

#### First Visit Data Includes

- `first_visit_timestamp` - ISO 8601 timestamp
- `first_visit_date` - YYYY-MM-DD format
- `first_visit_time` - HH:MM format
- `first_visit_day_of_week` - Monday, Tuesday, etc.
- `first_visit_hour_of_day` - 0-23 numeric hour
- `first_visit_timezone` - User's timezone
- `first_visit_is_weekend` - Boolean flag

#### App Opened Data Includes

- `timestamp` - ISO 8601 timestamp
- `date` - YYYY-MM-DD format
- `time` - HH:MM format
- `day_of_week` - Monday, Tuesday, etc.
- `hour_of_day` - 0-23 numeric hour
- `timezone` - User's timezone
- `is_weekend` - Boolean flag

#### Returning User Data

- `is_returning_user` - Boolean flag
- `days_since_first_visit` - Number of days since first visit
- `first_visit_date` - Original first visit date for reference

### Custom Events (Outside of Enum)

For events not in the predefined enum:

```dart
await analyticsService.logCustomEvent(
  'special_event',
  parameters: {
    'custom_param': 'value',
    'numeric_param': 42,
  },
);
```

## Available Events

The `AnalyticsEvent` enum includes:

### Page Views

- `homePageView`
- `personalPageView`
- `personalSectionView`

### Navigation

- `navigateToPersonal`
- `navigateToHome`

### Social Media & Contact

- `socialMediaClick`
- `emailClick`
- `phoneClick`

### Projects & Portfolio

- `projectClick`
- `cvDownload`
- `projectDetailView`

### Skills & Experience

- `skillClick`
- `experienceView`
- `educationView`

### UI Interactions

- `avatarClick`
- `search`
- `share`

### Technical

- `appVersion`
- `errorOccurred`
- `performanceMetric`

### App Lifecycle

- `firstVisit`
- `appOpened`

### Engagement

- `sessionDuration`
- `pageScrollComplete`
- `userEngagement`

### Generic

- `externalLinkClick`

## Adding New Events

To add a new event:

1 Add it to the `AnalyticsEvent` enum in `lib/models/enums/analytics_event.dart`:

```dart
enum AnalyticsEvent {
  // ... existing events
  newEvent('new_event_name'),
}
```

2 Use it immediately:

```dart
await analyticsService.logEvent(
  AnalyticsEvent.newEvent,
  parameters: {'param1': 'value1'},
);
```

## Integration Examples

### In StatefulWidget

```dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AnalyticsService _analyticsService = AnalyticsService();

  @override
  void initState() {
    super.initState();
    _analyticsService.logEvent(AnalyticsEvent.homePageView);
  }

  void _onNavigateToPersonal() {
    _analyticsService.logEvent(
      AnalyticsEvent.navigateToPersonal,
      parameters: {'source': 'home_button'},
    );
    Navigator.pushNamed(context, '/personal');
  }
}
```

### Automatic URL Launcher Integration

The `launchURL` function in `lib/util/launcher.dart` automatically logs:

- Email clicks → `AnalyticsEvent.emailClick`
- Phone clicks → `AnalyticsEvent.phoneClick`
- Social media links → `AnalyticsEvent.socialMediaClick`
- External links → `AnalyticsEvent.externalLinkClick`

## User Properties

```dart
await analyticsService.setUserProperties(
  userType: 'visitor',
  preferredTheme: 'dark',
  deviceType: 'mobile',
  primaryLanguage: 'en',
);
```

## Firebase Analytics Observer

Automatic route tracking is handled via the observer:

```dart
// In main.dart
class App extends StatelessWidget {
  static final AnalyticsService analyticsService = AnalyticsService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: <NavigatorObserver>[analyticsService.observer],
      // ... rest of app configuration
    );
  }
}
```

## Debug Mode

In debug mode, all analytics events are printed to the console:

```sh
Analytics Event: home_page_view
Analytics Event: navigate_to_personal with parameters: {source: home_button}
Analytics Event: social_media_click with parameters: {platform: LinkedIn, url: https://...}
```

## Best Practices

1. **Use the enum**: Stick to predefined events in `AnalyticsEvent` for consistency
2. **Consistent parameters**: Use the same parameter names across similar events
3. **Meaningful names**: Choose descriptive parameter names
4. **Don't over-log**: Focus on meaningful user interactions
5. **Include context**: Add source/context information where helpful

## Migration from Old Service

Old approach:

```dart
await analyticsService.logHomePageView();
await analyticsService.logNavigateToPersonal(source: 'button');
```

New approach:

```dart
await analyticsService.logEvent(AnalyticsEvent.homePageView);
await analyticsService.logEvent(
  AnalyticsEvent.navigateToPersonal,
  parameters: {'source': 'button'},
);
```

## Firebase Analytics Dashboard

All events will appear in your Firebase Analytics dashboard with their exact enum names and parameters for easy tracking and analysis.

## Privacy Considerations

- Analytics are automatically disabled in debug mode for privacy
- Consider implementing user consent mechanisms for GDPR compliance
- Review Firebase Analytics data retention settings in your Firebase console
