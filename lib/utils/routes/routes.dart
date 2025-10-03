import 'package:flutter/material.dart';

import '../../view/Deshboard/deshboard.dart';
import '../../view/Homepage/homepage.dart';
import '../../view/Story/storyOpen.dart';

class Routes {
  Routes._();

  static const String main = '/main';
  static const String login = '/login';
  static const String deshboard = "/Deshboard";
  static const String weatherhomepage = "/weatherhomepage";
  static const String storyopenpage = "/StoryOpenPage";


  static final routes = <String, WidgetBuilder>{

    deshboard: (BuildContext context) =>const Deshboard(),
    weatherhomepage: (BuildContext context) =>NewsHomePage(),
  storyopenpage: (BuildContext context) {
  final args =
  ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  return StoryOpenPage(
    index:args['index'],);
  },
  };
}
