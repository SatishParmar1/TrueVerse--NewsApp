import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:trueverse/utils/routes/routes.dart';
import 'package:trueverse/view/Homepage/home_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

void main() {
  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<HomePageBloc>(create: (_) => HomePageBloc(),),
          ],
        child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary:  Color(0xFF290849),
          background: Color.fromARGB(255, 255, 255, 255),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 57, 83, 47)),
          hintStyle: TextStyle(color: Color.fromARGB(255, 31, 31, 31)),
        ),
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          color: Color.fromARGB(255, 57, 83, 47),
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          elevation: 1,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute:  Routes.deshboard,    //main_screen

      // initialRoute: isLoggedInState! ? Routes.main : Routes.login,
      navigatorObservers: [routeObserver],
      routes: Routes.routes,
    );
  }
}

