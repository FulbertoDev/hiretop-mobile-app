/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/img/avatar.png');

  /// File path: assets/img/search.png
  AssetGenImage get search => const AssetGenImage('assets/img/search.png');

  /// List of all assets
  List<AssetGenImage> get values => [avatar, search];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/chat-icon.svg
  SvgGenImage get chatIcon => const SvgGenImage('assets/svg/chat-icon.svg');

  /// File path: assets/svg/connection-icon.svg
  SvgGenImage get connectionIcon =>
      const SvgGenImage('assets/svg/connection-icon.svg');

  /// File path: assets/svg/delete-icon.svg
  SvgGenImage get deleteIcon => const SvgGenImage('assets/svg/delete-icon.svg');

  /// File path: assets/svg/empty-illustration.svg
  SvgGenImage get emptyIllustration =>
      const SvgGenImage('assets/svg/empty-illustration.svg');

  /// File path: assets/svg/eye-icon.svg
  SvgGenImage get eyeIcon => const SvgGenImage('assets/svg/eye-icon.svg');

  /// File path: assets/svg/eye-slash-icon.svg
  SvgGenImage get eyeSlashIcon =>
      const SvgGenImage('assets/svg/eye-slash-icon.svg');

  /// File path: assets/svg/fav-icon.svg
  SvgGenImage get favIcon => const SvgGenImage('assets/svg/fav-icon.svg');

  /// File path: assets/svg/home-icon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/svg/home-icon.svg');

  /// File path: assets/svg/interview.svg
  SvgGenImage get interview => const SvgGenImage('assets/svg/interview.svg');

  /// File path: assets/svg/landing-illustration.svg
  SvgGenImage get landingIllustration =>
      const SvgGenImage('assets/svg/landing-illustration.svg');

  /// File path: assets/svg/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/svg/logo.svg');

  /// File path: assets/svg/pdf-icon.svg
  SvgGenImage get pdfIcon => const SvgGenImage('assets/svg/pdf-icon.svg');

  /// File path: assets/svg/successful-illustration.svg
  SvgGenImage get successfulIllustration =>
      const SvgGenImage('assets/svg/successful-illustration.svg');

  /// File path: assets/svg/upload-resume-icon.svg
  SvgGenImage get uploadResumeIcon =>
      const SvgGenImage('assets/svg/upload-resume-icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        chatIcon,
        connectionIcon,
        deleteIcon,
        emptyIllustration,
        eyeIcon,
        eyeSlashIcon,
        favIcon,
        homeIcon,
        interview,
        landingIllustration,
        logo,
        pdfIcon,
        successfulIllustration,
        uploadResumeIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsImgGen img = $AssetsImgGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
