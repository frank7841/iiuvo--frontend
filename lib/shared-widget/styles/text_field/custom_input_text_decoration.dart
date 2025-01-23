
import 'package:iiuovo/shared-widget/commons/commons.dart';
import 'package:iiuovo/shared-widget/styles/text/custom_text_style.dart';

class CustomInputDecoration {
  static InputDecoration textInputDecoration({
    String? hintText,
    Widget? suffixIcon,
    Color? labelColor,
    Color? fillColor,
    Widget? prefixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontStyle: CustomTextStyle.labelStyle.fontStyle,
          fontSize: CustomTextStyle.labelStyle.fontSize,
          fontWeight: CustomTextStyle.labelStyle.fontWeight,
          color: labelColor,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: kBlueGrey1,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 30,
          top: 10,
          bottom: 10,
          right: 10,
        ),
        labelStyle: TextStyle(
          color: labelColor ?? kBlack1,
          fontWeight: FontWeight.w400,
        ),
        fillColor: fillColor ?? kWhite1,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.solid,
          ),
        ),
        suffixIcon: suffixIcon,
      );

  static BoxDecoration dialogDecoration({
    Color? fillColor,
  }) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: fillColor ?? kWhite1,
      );
}
