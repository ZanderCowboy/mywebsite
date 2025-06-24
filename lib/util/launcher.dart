import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  // Handle different URL types
  if (url.startsWith('mailto:')) {
    await _launchEmail(url);
  } else if (url.startsWith('tel:')) {
    await _launchPhone(url);
  } else {
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
