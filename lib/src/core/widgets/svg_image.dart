import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  SvgImage(
    String url, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.colorFilter,
    this.setColorFilter = true,
  }) : child = SvgPicture.asset(
          url,
          width: width,
          height: height,
          fit: fit,
          colorFilter: setColorFilter
              ? ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn)
              : colorFilter,
        );

  final double? width;
  final double? height;
  final BoxFit fit;
  final bool setColorFilter;
  final Color? color;
  final ColorFilter? colorFilter;
  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
