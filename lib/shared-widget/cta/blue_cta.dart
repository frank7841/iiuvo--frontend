import 'package:iiuovo/shared-widget/commons/commons.dart';
import 'package:iiuovo/shared-widget/styles/gradient/custom_gradient_style.dart';

class BlueCta extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressedCallback;
  final double left, top, right, bottom;

  // put this the same as the value of borderRadius in decoration to remove the unwanted shadow
  final BorderRadius? ctaBorderRadius;
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final bool disabled;

  const BlueCta({
    super.key,
    this.width,
    this.height,
    this.text,
    this.textColor,
    this.left = 0,
    this.top = 15,
    this.right = 0,
    this.bottom = 15,
    this.disabled = false,
    this.ctaBorderRadius,
    this.onPressedCallback,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: CustomGradientStyle.boxDecorationGradientBlue,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kBlue1,
          shadowColor: kBlue1,
          foregroundColor: kBlue1,
        ),
        onPressed: onPressedCallback,
        child: Padding(
          padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          child: Text(
            text ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? kWhite1,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
