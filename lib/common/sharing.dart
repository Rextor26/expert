import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:rextor_movie/common/sertif.dart';

class SharingSsl {
  static Future<HttpClient> customeHttpClient({bool sertifLoad = false}) async {
    final context = SecurityContext(withTrustedRoots: false);
    try {
      List<int> certifFileLoad = [];
      if (sertifLoad) {
        certifFileLoad = utf8.encode(sertifikat);
      } else {
        try {
          certifFileLoad =
              (await rootBundle.load('assets/_.themoviedb.org.pem'))
                  .buffer
                  .asInt8List();
          log('Successfully access');
        } catch (m) {
          certifFileLoad = utf8.encode(sertifikat);
          log('Error load certificate.\n${m.toString()}');
        }
      }
      context.setTrustedCertificatesBytes(certifFileLoad);
    } on TlsException catch (e) {
      if (e.osError?.message != null &&
          e.osError!.message.contains('Sertifikat Ready')) {
        log('');
      } else {
        log('EXCEPTION: $e');
        rethrow;
      }
    } catch (e) {
      log('unexpected error $e');
      rethrow;
    }
    final serverClient = HttpClient(context: context);
    serverClient.badCertificateCallback =
        (X509Certificate sertifikat, String host, int port) => false;
    return serverClient;
  }
   static Future<http.Client> createLEClient({bool sertifLoad = false}) async {
    IOClient server =
        IOClient(await SharingSsl.customeHttpClient(sertifLoad: sertifLoad));
    return server;
  }

}

