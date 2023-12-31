import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  SvgImage(
    String url, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.colorFilter,
  }) : child = SvgPicture.asset(
          url,
          width: width,
          height: height,
          fit: fit,
          colorFilter: colorFilter,
        );

  SvgImage.network(
    String url, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.colorFilter,
  }) : child = SvgPicture.network(
          url,
          width: width,
          height: height,
          fit: fit,
          colorFilter: colorFilter,
        );

  SvgImage.file(
    File file, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.colorFilter,
  }) : child = SvgPicture.file(
          file,
          width: width,
          height: height,
          fit: fit,
          colorFilter: colorFilter,
        );

  SvgImage.memory(
    Uint8List bytes, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.colorFilter,
  }) : child = SvgPicture.memory(
          bytes,
          width: width,
          height: height,
          fit: fit,
          colorFilter: colorFilter,
        );

  final double? width;
  final double? height;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
