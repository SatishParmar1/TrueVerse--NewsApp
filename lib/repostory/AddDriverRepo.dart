import 'dart:developer';

import 'package:flutter/material.dart';

import '../data/remote/network/ApiEndPoints.dart';
import '../data/remote/network/BaseApiService.dart';
import '../data/remote/network/NetworkApiService.dart';

class AddDriverRepo {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<bool?> addDriver(BuildContext context, String Endpoint) async {
    try {
      dynamic response = await _apiService.getResponse(Endpoint);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response['message'])));
      // log("Log: ${}");
      if (response['error'] == true) {
        // DialogUtils.showErrorPopup(context, response['message']);
        return false;
      }
      return true;
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
