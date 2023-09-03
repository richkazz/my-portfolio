import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future launchUrl(String urlString) async {
    try {
      if (await canLaunchUrl(Uri(host: urlString))) {
        launchUrl(urlString);
      } else {
        // ? show its not opening
      }
    } catch (e) {
      // ! Show error
    }
  }
}
