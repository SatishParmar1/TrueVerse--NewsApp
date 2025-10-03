part of 'story_page_bloc.dart';

@immutable
sealed class StoryPageEvent {}

class RestartTimerEvent extends StoryPageEvent {}

class FetchData extends StoryPageEvent {}

class SetIndex extends StoryPageEvent {
  final int index;
  SetIndex({required this.index});
}

class IncreaseIndex extends StoryPageEvent{}

class DecrementIndex extends StoryPageEvent{}