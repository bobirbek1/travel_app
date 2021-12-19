import 'dart:math';

import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color = Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 6.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 3.0;

  static const double _kDotPadding = 3.5;

  static const double _kContainerPadding = 17;

  static const double _kContainerHeight = 21;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom) * selectedness;
    double opacity = 1.0 -
        (0.1 * ((controller.page ?? controller.initialPage) - index).abs());

    if (opacity < 0.5) opacity = 0.5;

    var usedColor = color.withOpacity(opacity);
    return Center(
      child: Container(
        width: _kDotSize * zoom,
        height: _kDotSize,
        margin: const EdgeInsets.symmetric(
          horizontal: _kDotPadding,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              _kDotSize,
            ),
            color: usedColor),
        child: InkWell(
          onTap: () => onPageSelected(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var containerWidth = itemCount * _kDotSize +
        _kDotSize * _kMaxZoom +
        (itemCount - 1) * 2 * _kDotPadding +
        2 * _kContainerPadding;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
    // );
  }
}
