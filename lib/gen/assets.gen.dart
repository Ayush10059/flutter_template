/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $GoogleFontsGen {
  const $GoogleFontsGen();

  /// File path: google_fonts/LICENSE.txt
  String get license => 'google_fonts/LICENSE.txt';

  /// File path: google_fonts/Roboto-Black.ttf
  String get robotoBlack => 'google_fonts/Roboto-Black.ttf';

  /// File path: google_fonts/Roboto-Bold.ttf
  String get robotoBold => 'google_fonts/Roboto-Bold.ttf';

  /// File path: google_fonts/Roboto-Italic.ttf
  String get robotoItalic => 'google_fonts/Roboto-Italic.ttf';

  /// File path: google_fonts/Roboto-Light.ttf
  String get robotoLight => 'google_fonts/Roboto-Light.ttf';

  /// File path: google_fonts/Roboto-Medium.ttf
  String get robotoMedium => 'google_fonts/Roboto-Medium.ttf';

  /// File path: google_fonts/Roboto-Regular.ttf
  String get robotoRegular => 'google_fonts/Roboto-Regular.ttf';

  /// File path: google_fonts/Roboto-Thin.ttf
  String get robotoThin => 'google_fonts/Roboto-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        license,
        robotoBlack,
        robotoBold,
        robotoItalic,
        robotoLight,
        robotoMedium,
        robotoRegular,
        robotoThin
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/.gitkeep
  String get gitkeep => 'assets/icons/.gitkeep';

  /// File path: assets/icons/calendar.svg
  String get calendar => 'assets/icons/calendar.svg';

  /// File path: assets/icons/glyph.svg
  String get glyph => 'assets/icons/glyph.svg';

  /// File path: assets/icons/google-calendar.svg
  String get googleCalendar => 'assets/icons/google-calendar.svg';

  /// File path: assets/icons/notification.svg
  String get notification => 'assets/icons/notification.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// List of all assets
  List<String> get values =>
      [gitkeep, calendar, glyph, googleCalendar, notification, profile, search];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_development.png
  AssetGenImage get logoDevelopment =>
      const AssetGenImage('assets/images/logo_development.png');

  /// File path: assets/images/logo_production.png
  AssetGenImage get logoProduction =>
      const AssetGenImage('assets/images/logo_production.png');

  /// File path: assets/images/logo_staging.png
  AssetGenImage get logoStaging =>
      const AssetGenImage('assets/images/logo_staging.png');

  /// File path: assets/images/meeting.jpeg
  AssetGenImage get meeting =>
      const AssetGenImage('assets/images/meeting.jpeg');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/splash_12.png
  AssetGenImage get splash12 =>
      const AssetGenImage('assets/images/splash_12.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        logo,
        logoDevelopment,
        logoProduction,
        logoStaging,
        meeting,
        splash,
        splash12
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $GoogleFontsGen googleFonts = $GoogleFontsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
