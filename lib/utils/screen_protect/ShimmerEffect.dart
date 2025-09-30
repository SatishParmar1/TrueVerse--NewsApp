import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(seconds: 1),
      color: Colors.grey.shade600,
      direction: const ShimmerDirection.fromLeftToRight(),
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Color(0xffEBEBEB),
          shape: shapeBorder,
        ),
      ),
    );
  }
}