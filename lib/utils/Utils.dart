import 'package:flutter/material.dart';

class Utils {
  static void openImage(BuildContext context, String imageUrl) {
    Navigator.pushNamed(
      context,
      '/view_image', arguments: imageUrl
    );
  }
}