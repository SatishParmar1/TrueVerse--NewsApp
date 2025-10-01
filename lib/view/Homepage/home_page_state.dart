part of 'home_page_bloc.dart';

class HomePageState {
  final LinearTimerController timerController;

  HomePageState({required this.timerController});

  HomePageState copyWith({
    LinearTimerController? timerController,
  }) {
    return HomePageState(
      timerController: timerController ?? this.timerController,
    );
  }
}
