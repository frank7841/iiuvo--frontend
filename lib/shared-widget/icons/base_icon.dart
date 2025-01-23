
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iiuovo/shared-widget/commons/commons.dart';

class BaseIcon extends StatelessWidget {
  final VoidCallback? onPressedCallback;
  final Color? color;
  final String svgFileName;
  final double width;
  final double height;
  final bool? isPng;

  final IconData? materialIcon;

  const BaseIcon({
    super.key,
    required this.svgFileName,
    this.isPng = false,
    this.onPressedCallback,
    this.color,
    this.width = 15.0,
    this.height = 15.0,
    this.materialIcon,
  });

  @override
  Widget build(BuildContext context) {
    final String svgAsset = isPng == false
        ? svgIconsPath + svgFileName
        : pngIconsPath + svgFileName;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        onPressed: onPressedCallback,
        icon: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: isPng == true
              ? Image.asset(
            svgAsset,
            color: color ?? kBlack1,
            width: width,
            height: height,
          )
              : materialIcon != null
              ? Icon(
            materialIcon,
            color: color ?? kBlack1,
            size: height,
          )
              : SvgPicture.asset(
            svgAsset,
            colorFilter:
            ColorFilter.mode(color ?? kBlack1, BlendMode.srcIn),
            width: width,
            height: height,
          ),
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}