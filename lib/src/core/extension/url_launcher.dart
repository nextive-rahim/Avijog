import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher({String? link, Uri? uri}) async {
  final Uri? uriLink = link != null ? Uri.parse(link) : uri;
  if (await canLaunchUrl(uriLink ?? Uri())) {
    await launchUrl(
      uriLink!,
      mode: LaunchMode.externalApplication,
    );
  }
}
