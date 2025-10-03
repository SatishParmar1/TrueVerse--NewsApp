import 'dart:developer';
import 'package:flutter/material.dart';
import '../data/remote/network/ApiEndPoints.dart';
import '../data/remote/network/BaseApiService.dart';
import '../data/remote/network/NetworkApiService.dart';
import '../model/AddStoryResponse.dart';

class AddStoryRepo {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<NewsResponse?> GetStoryData(String Endpoint) async {
    try {
      dynamic response = await _apiService.getResponse(Endpoint);
      if (response['status'] == "error") {
      /*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['message'])));*/
        return null;
      }
      final jsonData = NewsResponse.fromJson(response);
      return jsonData;
    } catch (e) {
      log(e.toString());
    /*  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));*/
      throw e.toString();
    }
  }

}

