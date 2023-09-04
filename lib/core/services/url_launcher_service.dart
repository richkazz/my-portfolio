import 'package:url_launcher/url_launcher.dart' as u;

class UrlLauncherService {
  Future launchUrl(String urlString) async {
    try {
      if (await u.canLaunchUrl(Uri.parse(urlString))) {
        await u.launchUrl(Uri.parse(urlString));
      } else {
        // ? show its not opening
      }
    } catch (e) {
      // ! Show error
    }
  }
}
