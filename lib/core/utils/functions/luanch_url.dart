import 'package:url_launcher/url_launcher.dart';

import '../../widgets/custom_snack_Bar.dart';

Future<void> launchCustomUr(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnackBar(context, 'Cannot launch $url');
    }
  }
}
