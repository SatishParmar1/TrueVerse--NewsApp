import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trueverse/view/Story/storyOpen.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState(timerController: LinearTimerController())) {
    on<RestartTimerEvent>((event, emit) {
      state.timerController.restart();
    });
  }
}
