import 'package:flutter/material.dart';

import '../../constants/appConstant.dart';

class StoryOpenPage extends StatelessWidget {
  final String url;
   StoryOpenPage({super.key, required this.url});
  final timerController = LinearTimerController();

  ///Restart timer



  // Function called when right side is tapped
  void onRightSideTap() {
    timerController.restart();
    print("Right side tapped!");
    // Add your custom functionality here
  }

  // Function called when left side is tapped
  void onLeftSideTap() {
    timerController.restart();
    print("Left side tapped!");
    // Add your custom functionality here
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width*1;
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (details) {
          final tapX = details.localPosition.dx;

          if (tapX < screenWidth / 2) {
            onLeftSideTap();
          } else {
            onRightSideTap();
          }
        },
        child: Column(
          children: [
            SizedBox(height: 40,),
            LinearTimer(
              durationSeconds: 5,
              color: Colors.white,
              onCompleted: () {
                print("Timer finished!");
              },
            ),
            Container(
              padding:  EdgeInsets.symmetric(horizontal: Constants.horizontalPadding, vertical: Constants.verticalPadding),
              child: ListTile(
                title: const Text(
                  "Hello world",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "last 2 days",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            // Make the image take the remaining space
            Expanded(
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.error, color: Colors.white, size: 50),
                  );
                },
              ),
            ),
          ],
        ),
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

    _startTimer();
  }

  void _startTimer() {
    _controller.forward(from: 0);
    _controller.addStatusListener(_statusListener);
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
