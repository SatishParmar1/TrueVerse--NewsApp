import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trueverse/view/Story/story_page_bloc.dart';
import '../../constants/appConstant.dart';

class StoryOpenPage extends StatefulWidget {
  final int index;
  StoryOpenPage({super.key, required this.index});

  @override
  State<StoryOpenPage> createState() => _StoryOpenPageState();
}

class _StoryOpenPageState extends State<StoryOpenPage> {
  void onRightSideTap(BuildContext context, int length) {
    final bloc = context.read<StoryPageBloc>();
    if ((bloc.state.CurrentIndex ?? 0) < 19) {
      bloc.add(IncreaseIndex());
      context.read<StoryPageBloc>().add(RestartTimerEvent());
    }
    print("Right side tapped!");
  }

  // Function called when left side is tapped
  void onLeftSideTap(BuildContext context) {
    final bloc = context.read<StoryPageBloc>();
    if ((bloc.state.CurrentIndex ?? 0) > 0) {
      bloc.add(DecrementIndex());
      context.read<StoryPageBloc>().add(RestartTimerEvent());
    }
    print("Left side tapped!");
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      context.read<StoryPageBloc>().add(SetIndex(index: widget.index ?? 0));
      print("asd");
    });
    final bloc = context.read<StoryPageBloc>();
    if (bloc.state.responseData == null) {
      bloc.add(FetchData());
    }
    /*    context.read<StoryPageBloc>().add(FetchData());*/
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Constants.widgetBackgoundColor,
        title: BlocConsumer<StoryPageBloc, StoryPageState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final articles = state.responseData!.articles!;
            final article = articles[state.CurrentIndex??0];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.author??"",
                  style: TextStyle(
                    fontSize: Constants.titleFontSize,
                    color: Constants.fontColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  "4h ago",
                  style: TextStyle(
                    fontSize: Constants.subtitleFontSize,
                    color: Constants.fontColor.withValues(alpha: 0.6),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: BlocBuilder<StoryPageBloc, StoryPageState>(
        builder: (context, state) {
          // Show loader if data not ready
          if (state.responseData == null ||
              state.responseData!.articles == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            );
          }

          final articles = state.responseData!.articles!;
          final article = articles[state.CurrentIndex ?? 0];

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: (details) {
              final tapX = details.localPosition.dx;
              if (tapX < screenWidth / 2) {
                onLeftSideTap(context);
              } else {
                onRightSideTap(context, articles.length);
              }
            },
            child: Column(
              children: [
                const SizedBox(height: 10),
                LinearTimer(
                  durationSeconds: 5,
                  color: Colors.blue,
                  onCompleted: () {
                    // Auto go to next story when timer completes
                    onRightSideTap(context, articles.length);
                  },
                  controller: state.timerController,
                ),

                Expanded(
                  child: article.urlToImage != null
                      ? Image.network(
                          article.urlToImage!,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        )
                      : const Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.title ?? "No Title",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Controller to restart the LinearTimer
class LinearTimerController {
  VoidCallback? _restart;

  /// Call this to restart the timer
  void restart() {
    if (_restart != null) _restart!();
  }
}

class LinearTimer extends StatefulWidget {
  final int durationSeconds; // total duration in seconds
  final Color color; // progress color
  final VoidCallback onCompleted; // callback when timer completes
  final LinearTimerController? controller;

  const LinearTimer({
    super.key,
    this.durationSeconds = 5,
    this.color = Colors.blue,
    required this.onCompleted,
    this.controller,
  });

  @override
  State<LinearTimer> createState() => _LinearTimerState();
}

class _LinearTimerState extends State<LinearTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationSeconds),
    );

    // Assign restart function to controller
    widget.controller?._restart = _restartTimer;

    // ✅ Attach listener only once
    _controller.addStatusListener(_statusListener);

    _startTimer();
  }

  void _startTimer() {
    _controller.forward(from: 0);
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onCompleted();
    }
  }

  /// Restart the timer from outside
  void _restartTimer() {
    _controller.stop();
    _controller.reset();
    _startTimer();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_statusListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return LinearProgressIndicator(
            value: _controller.value,
            color: widget.color,
            backgroundColor: widget.color.withOpacity(0.3),
          );
        },
      ),
    );
  }
}
