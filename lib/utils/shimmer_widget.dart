import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius shapeBorder;

  ShimmerWidget.rectangular(
      {required this.height,
      this.width = double.infinity,
      this.shapeBorder = BorderRadius.zero});

  ShimmerWidget.circular(
      {required this.height,
      this.width = double.infinity,
      required,
      required this.shapeBorder});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: height,
        width: width,
        decoration:
            BoxDecoration(borderRadius: shapeBorder, color: Colors.grey),
      ),
    );
  }
}
