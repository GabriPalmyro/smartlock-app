import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';

class Skeleton extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  const Skeleton({super.key, required this.height, required this.width, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.3),
      highlightColor: Colors.grey[100]!.withOpacity(0.3),
      child: Container(
        decoration: BoxDecoration(
            color: kWhite.withOpacity(0.57),
            borderRadius: BorderRadius.circular(radius)),
        height: height,
        width: width,
      ),
    );
  }
}
