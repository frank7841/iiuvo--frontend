import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iiuovo/shared-widget/appbar/iiuvo_app_bar.dart';
import 'package:iiuovo/shared-widget/commons/commons.dart';
import 'package:iiuovo/shared-widget/commons/translations.dart';
import 'package:iiuovo/shared-widget/cta/blue_cta.dart';
import 'package:iiuovo/shared-widget/styles/text/custom_text_style.dart';
import 'package:iiuovo/shared-widget/styles/text/h2.dart';
import 'package:iiuovo/shared-widget/styles/text_field/custom_input_text_decoration.dart';
import 'package:iiuovo/shared-widget/text_field/custom_textfield.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final _basicFormKey = GlobalKey<FormBuilderState>();
  final TextEditingController fullNameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPassTextController =
  TextEditingController();
  final TextEditingController mobilePhoneTextController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = getSizeFromContext(context);

    return Scaffold(
      appBar: IiuvoAppBar(
        text: LocaleKeys.signUp.tr(),
        isLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery
                .of(context)
                .viewInsets
                .bottom + 20,
          ),
          child: FormBuilder(
            key: _basicFormKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: H2(text: LocaleKeys.welcomeTitle.tr()),
                  ),
                  SizedBox(height: scaleBy(size.height, 0.02)),
                  Text(
                    LocaleKeys.signupTitle.tr(),
                    style: const TextStyle(color: kBlack1, fontSize: 18),
                  ),
                  SizedBox(height: scaleBy(size.height, 0.04)),
                  // Full Name
                  buildLabel(LocaleKeys.fullNameLabel.tr()),
                  buildCustomTextField(
                    name: 'fullNameField',
                    controller: fullNameTextController,
                    hintText: LocaleKeys.enterFullName.tr(),
                  ),
                  // Email
                  buildLabel(LocaleKeys.emailLabel.tr()),
                  buildCustomTextField(
                    name: 'emailField',
                    controller: emailTextController,
                    hintText: LocaleKeys.enterEmail.tr(),
                  ),
                  // Mobile Phone
                  buildLabel(LocaleKeys.phoneLabel.tr()),
                  buildCustomTextField(
                    name: 'mobilePhoneField',
                    controller: mobilePhoneTextController,
                    hintText: LocaleKeys.enterPhone.tr(),
                    keyboardType: TextInputType.phone,
                  ),
                  // Password
                  buildLabel(LocaleKeys.passwordLabel.tr()),
                  buildCustomTextField(
                    name: 'passwordField',
                    controller: passwordTextController,
                    hintText: LocaleKeys.enterPassword.tr(),
                    isPasswordType: true,
                  ),
                  // Confirm Password
                  buildLabel(LocaleKeys.confirmPasswordLabel.tr()),
                  buildCustomTextField(
                    name: 'confirmPassField',
                    controller: confirmPassTextController,
                    hintText: LocaleKeys.confirmPassword.tr(),
                    isPasswordType: true,
                  ),
                  SizedBox(height: scaleBy(size.height, 0.04)),
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: BlueCta(
                      text: LocaleKeys.signUp.tr().toUpperCase(),
                      ctaBorderRadius: BorderRadius.circular(15),
                      onPressedCallback: () {
                        if (_basicFormKey.currentState?.validate() ?? false) {
                          // Handle form submission
                          context.pushNamed(verifyPhone);
                        }
                      },
                    ),
                  ),
                  SizedBox(height: scaleBy(size.height, 0.01)),
                  Center(
                    child: Text(
                      LocaleKeys.termsAndConditions.tr(),
                      style: CustomTextStyle.labelStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
