
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iiuovo/shared-widget/commons/commons.dart';

class CustomTextField extends ConsumerWidget {
  final String name;
  final bool isPasswordType;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final InputDecoration decoration;
  final bool readOnly;
  final String? Function(dynamic value)? validator;
  final void Function(String?)? onChanged;

  const CustomTextField({
    super.key,
    required this.name,
    required this.isPasswordType,
    this.controller,
    required this.textInputAction,
    required this.decoration,
    required this.validator,
    this.onChanged,
    this.readOnly = false, required TextInputType keyboardType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderTextField(
      name: name,
      readOnly: readOnly,
      controller: controller,
      textInputAction: textInputAction,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: kGrey1,
      style: const TextStyle(color: kBlack1),
      decoration: decoration,
      validator: validator,
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      onChanged: onChanged,
    );
  }
}
