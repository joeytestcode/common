import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'common_strings.dart';

const String homePage = 'https://joeyhwang.tistory.com';

class JAbout extends StatelessWidget {
  const JAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri uri = Uri.parse(homePage);
    return Column(
      children: [
        Image.memory(base64.decode(imageLogo)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              child: const Text(homePage),
              onTap: () => launchUrl(
                uri,
                mode: LaunchMode.externalApplication,
              ),
            )
          ],
        )
      ],
    );
  }
}
