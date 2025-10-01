import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class BaseApiService {
  static const String _stagingURL = "https://newsapi.org/v2/everything?";
  static const String _prodEndpoint = "https://newsapi.org/v2/everything?";
  // static const String _debugLocalEndpoint = "http://10.0.2.2:8000/";
  //static const String _productionEndpoint = "https://api.kelola.co/";

  static const String BASE_URL = kReleaseMode ? _stagingURL : _stagingURL;
  static const String STAGING_URL = kReleaseMode ? _stagingURL : _stagingURL;

  Future getResponse(
    String url,
  );

  static const String BASE_URL_IMAGE = "http://13.200.120.232/";

  Future getResponseQuery(String url, Map<String, dynamic> queryData);

  Future postResponse(String url);

  Future postResponseString(String url, dynamic formData);

  Future putResponse(String path, dynamic data);

  Future deleteResponse(String url, FormData formData);

  Future patchResponseForm(String url, FormData formData);

  Future patchResponse(String url, String formData);
}
