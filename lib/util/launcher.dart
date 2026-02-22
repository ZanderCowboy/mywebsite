import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:mywebsite/models/parameters.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:url_launcher/url_launcher.dart';

/// Launch a URL with optional analytics context
Future<void> launchURL(
  String url, {
  Parameters? analyticsParams,
  bool skipAnalytics = false,
}) async {
  if (skipAnalytics) {
    // Skip analytics completely
    if (url.startsWith('mailto:')) {
      await _launchEmail(url);
    } else if (url.startsWith('tel:')) {
      await _launchPhone(url);
    } else {
      await _launchGenericURL(url);
    }
    return;
  }

  final analyticsService = AnalyticsService();

  // Handle different URL types
  if (url.startsWith('mailto:')) {
    final email = url.replaceFirst('mailto:', '');
    await analyticsService.logEvent(
      AnalyticsEvent.emailClick,
      parameters: analyticsParams ?? Parameters(emailAddress: email),
    );
    await _launchEmail(url);
  } else if (url.startsWith('tel:')) {
    final phone = url.replaceFirst('tel:', '');
    await analyticsService.logEvent(
      AnalyticsEvent.phoneClick,
      parameters: analyticsParams ?? Parameters(phoneNumber: phone),
    );
    await _launchPhone(url);
  } else {
    // If custom parameters provided, use them
    if (analyticsParams != null) {
      // Determine event type based on parameters or URL
      var event = AnalyticsEvent.externalLinkClick;

      // Check for specific item types
      if (analyticsParams.itemType == 'cv') {
        event = AnalyticsEvent.cvDownload;
      } else if (analyticsParams.itemType == 'social_pill' ||
          analyticsParams.linkType == 'social_media') {
        event = AnalyticsEvent.socialMediaClick;
      } else if (analyticsParams.itemType == 'education_link' ||
          analyticsParams.linkType == 'education') {
        event = AnalyticsEvent.educationLinkClick;
      } else if (url.contains('linkedin.com') ||
          url.contains('github.com') ||
          url.contains('twitter.com') ||
          url.contains('x.com') ||
          url.contains('instagram.com') ||
          url.contains('youtube.com') ||
          url.contains('discord.com')) {
        event = AnalyticsEvent.socialMediaClick;
      }

      await analyticsService.logEvent(event, parameters: analyticsParams);
    } else {
      // Default behavior: Log social media clicks based on URL patterns
      if (url.contains('linkedin.com')) {
        await analyticsService.logEvent(
          AnalyticsEvent.socialMediaClick,
          parameters: Parameters(platform: 'LinkedIn', url: url),
        );
      } else if (url.contains('github.com')) {
        await analyticsService.logEvent(
          AnalyticsEvent.socialMediaClick,
          parameters: Parameters(platform: 'GitHub', url: url),
        );
      } else if (url.contains('twitter.com') || url.contains('x.com')) {
        await analyticsService.logEvent(
          AnalyticsEvent.socialMediaClick,
          parameters: Parameters(platform: 'X (Twitter)', url: url),
        );
      } else if (url.contains('instagram.com')) {
        await analyticsService.logEvent(
          AnalyticsEvent.socialMediaClick,
          parameters: Parameters(platform: 'Instagram', url: url),
        );
      } else if (url.contains('youtube.com')) {
        await analyticsService.logEvent(
          AnalyticsEvent.socialMediaClick,
          parameters: Parameters(platform: 'YouTube', url: url),
        );
      } else if (url.contains('discord.com')) {
        await analyticsService.logEvent(
          AnalyticsEvent.socialMediaClick,
          parameters: Parameters(platform: 'Discord', url: url),
        );
      } else {
        await analyticsService.logEvent(
          AnalyticsEvent.externalLinkClick,
          parameters: Parameters(url: url),
        );
      }
    }
    await _launchGenericURL(url);
  }
}

Future<void> _launchEmail(String emailUrl) async {
  final uri = Uri.parse(emailUrl);

  // Try to launch with mailto: first (this should open the default email app)
  if (await canLaunchUrl(uri)) {
    final result = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (result) return;
  }

  // Fallback 1: Try Gmail app specific URL
  final email = emailUrl.replaceFirst('mailto:', '');
  final gmailAppUrl = 'googlegmail:///co?to=$email';

  final gmailAppUri = Uri.parse(gmailAppUrl);
  if (await canLaunchUrl(gmailAppUri)) {
    final result =
        await launchUrl(gmailAppUri, mode: LaunchMode.externalApplication);
    if (result) return;
  }

  // Fallback 2: Try Outlook app
  final outlookUrl = 'ms-outlook://compose?to=$email';

  final outlookUri = Uri.parse(outlookUrl);
  if (await canLaunchUrl(outlookUri)) {
    final result =
        await launchUrl(outlookUri, mode: LaunchMode.externalApplication);
    if (result) return;
  }

  // Fallback 3: Try Yahoo Mail app
  final yahooUrl = 'ymail://mail/compose?to=$email';

  final yahooUri = Uri.parse(yahooUrl);
  if (await canLaunchUrl(yahooUri)) {
    final result =
        await launchUrl(yahooUri, mode: LaunchMode.externalApplication);
    if (result) return;
  }

  // Final fallback: Gmail web
  final gmailWebUrl = 'https://mail.google.com/mail/?view=cm&fs=1&to=$email';

  final gmailWebUri = Uri.parse(gmailWebUrl);
  if (await canLaunchUrl(gmailWebUri)) {
    await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
  } else {}
}

Future<void> _launchPhone(String phoneUrl) async {
  final uri = Uri.parse(phoneUrl);

  // Try to launch with tel: first
  if (await canLaunchUrl(uri)) {
    final result = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (result) return;
  }

  // Fallback: Try to open WhatsApp
  final phone = phoneUrl.replaceFirst('tel:', '').replaceAll(' ', '');
  final whatsappUrl = 'https://wa.me/$phone';

  final whatsappUri = Uri.parse(whatsappUrl);
  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  } else {}
}

Future<void> _launchGenericURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {}
}
