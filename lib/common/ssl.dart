import 'package:http/http.dart' as http;
import 'package:rextor_movie/common/sharing.dart';

class SecurityPiningSLL {
  static http.Client? serverRepoClient;
  static Future<http.Client> get repo async =>
      serverRepoClient ??= await SharingSsl.createLEClient(); 
  static http.Client get client => serverRepoClient ?? http.Client();
  static Future<void> init() async {
    serverRepoClient = await repo;
  }
}
