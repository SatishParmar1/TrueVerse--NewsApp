import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trueverse/view/Story/storyOpen.dart';

import '../../model/AddStoryResponse.dart';
import '../../repostory/AddStoryRepo.dart';
part 'story_page_event.dart';
part 'story_page_state.dart';

class StoryPageBloc extends Bloc<StoryPageEvent, StoryPageState> {
  final AddStoryRepo _addStoryRepo = AddStoryRepo();

  String getTimeAgo(String dateString) {
    if (dateString.isEmpty) return '';

    try {
      final date = DateTime.parse(dateString).toLocal(); // Convert UTC → local
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inSeconds < 60) {
        return '${difference.inSeconds}s ago';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes}m ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours}h ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
      } else {
        return '${difference.inDays} days ago';
      }
    } catch (e) {
      // fallback if parsing fails
      return '';
    }
  }

  StoryPageBloc() : super(StoryPageState(timerController: LinearTimerController())) {
    on<RestartTimerEvent>((event, emit) {
      state.timerController.restart();
    });

    on<FetchData>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null, message: null));
      try {
        final data = await _addStoryRepo.GetStoryData("https://newsapi.org/v2/top-headlines?category=general&pageSize=20");
        emit(state.copyWith(
          isLoading: false,
          responseData: data,
          message: "Data loaded successfully",
        ));
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
          error: e.toString(),
          message: e.toString(),
        ));
      }
    });

    on<SetIndex>((event,emit)async{
      emit(state.copyWith(CurrentIndex: event.index));
      print(state.CurrentIndex);
    });

    on<IncreaseIndex>((event, emit) async {
      final currentIndex = state.CurrentIndex ?? 0;
      if (currentIndex < 19 - 1) {
        emit(state.copyWith(CurrentIndex: currentIndex + 1));
      }
    });

    on<DecrementIndex>((event, emit) async {
      final currentIndex = state.CurrentIndex ?? 0;
      if (currentIndex > 0) {
        emit(state.copyWith(CurrentIndex: currentIndex - 1));
      }
    });
  }
}