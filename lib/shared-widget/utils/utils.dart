
import 'package:iiuovo/shared-widget/commons/commons.dart';
import 'package:iiuovo/shared-widget/styles/text/custom_text_style.dart';
import 'package:iiuovo/shared-widget/styles/text_field/custom_input_text_decoration.dart';
import 'package:iiuovo/shared-widget/text_field/custom_textfield.dart';

Size getSizeFromContext(BuildContext context) {
  return MediaQuery.of(context).size;
}
double scaleBy(double initial, double scale) => initial * scale;


Widget buildLabel(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      text,
      style: CustomTextStyle.labelStyle,
    ),
  );
}

Widget buildCustomTextField({
  required String name,
  required TextEditingController controller,
  required String hintText,
  bool isPasswordType = false,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: CustomTextField(
      name: name,
      isPasswordType: isPasswordType,
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      decoration: CustomInputDecoration.textInputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return hintText;
        }
        return null;
      },
    ),
  );
}
