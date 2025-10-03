part of 'story_page_bloc.dart';

class StoryPageState {
  final LinearTimerController timerController;
  final bool isLoading;
  final String? error;
  final String? message;
  final NewsResponse? responseData;
  final int? CurrentIndex;

  StoryPageState({
    required this.timerController,
    this.isLoading = false,
    this.error,
    this.responseData,
    this.message,
    this.CurrentIndex,
  });

  StoryPageState copyWith({
    LinearTimerController? timerController,
    bool? isLoading,
    NewsResponse? responseData,
    String? error,
    String? message,
    int? CurrentIndex,
  }) {
    return StoryPageState(
      timerController: timerController ?? this.timerController,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      responseData: responseData ?? this.responseData,
      message: message ?? this.message,
      CurrentIndex:  CurrentIndex?? this.CurrentIndex ?? 0,
    );
  }
}

