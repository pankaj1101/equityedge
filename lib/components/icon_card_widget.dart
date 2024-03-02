import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconCardWidget extends StatelessWidget {
  const IconCardWidget({
    super.key,
    required this.iconPath,
  });

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 60,
      height: 60,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F6FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        iconPath,
      ),
    );
  }
}
