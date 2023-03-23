import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mywebsite/views/firstpage.dart';

LaunchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}