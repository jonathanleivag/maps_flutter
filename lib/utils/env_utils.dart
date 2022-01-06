import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvUtils {
 static final String? _mapboxAccessToken = dotenv.env['MAPBOX_ACCESS_TOKEN'];
 static final String? _uriMapboxStyleUrl = dotenv.env['URI_MAPBOX_STYLE_URL'];

  static String get mapboxAccessToken => _mapboxAccessToken ?? '';
  static String get uriMapboxStyleUrl => _uriMapboxStyleUrl ?? '';
}