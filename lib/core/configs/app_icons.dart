import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String pathIcons = 'assets/icons';

class AppIcons {
  static const home = '$pathIcons/home.svg';
  static const location = '$pathIcons/location.svg';
  static const book = '$pathIcons/book.svg';
  static const person = '$pathIcons/person.svg';
  static const noList = '$pathIcons/no-list.svg';
  static const arrowRight = '$pathIcons/arrow-right.svg';
  static const check = '$pathIcons/check.svg';
  static const edit = '$pathIcons/edit.svg';
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
