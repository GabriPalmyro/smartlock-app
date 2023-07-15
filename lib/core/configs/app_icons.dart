import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String pathIcons = 'assets/icons';

class AppIcons {
  static const onboarding1 = '$pathIcons/onboarding-1.svg';
}

class AppIcon extends StatelessWidget {
  final String icon;
  final Size size;
  final Color? color;

  const AppIcon({
    Key? key,
    required this.icon,
    this.color,
    this.size = const Size(24, 24),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return color != null ? SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
      height: size.height,
      width: size.width,
    ) : SvgPicture.asset(
      icon,
      height: size.height,
      width: size.width,
    );
  }
}
