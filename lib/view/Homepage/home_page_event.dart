part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class RestartTimerEvent extends HomePageEvent {}
