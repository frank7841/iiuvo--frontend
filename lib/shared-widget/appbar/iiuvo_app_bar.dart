
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iiuovo/shared-widget/commons/commons.dart';
import 'package:iiuovo/shared-widget/icons/base_icon.dart';

class IiuvoAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  final String text;
  final bool isLeading;
  final bool isElevated;
  const IiuvoAppBar({
    super.key,
    required this.text,
    this.isLeading = false,
    this.isElevated = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isLeading
          ? Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () => context.pop(),
              child: SizedBox(
                height: 40,
                width: 40,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kWhite1,

                  ),
                  padding: EdgeInsets.zero,
                  child: const BaseIcon(svgFileName: 'icon.svg')
                ),
              ),
            ),
          ),
        ],
      )
          : null,
      title: Text(
        text,
        style:  const TextStyle(
          color: kBlack1,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          wordSpacing: 1.0,
        ),
      ),
      centerTitle: true,
      elevation: isElevated ? 4.0 : 0.0,
      backgroundColor: kWhite1,
    );
  }
}
