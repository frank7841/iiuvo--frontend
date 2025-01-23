import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iiuovo/shared-widget/appbar/iiuvo_app_bar.dart';
import 'package:iiuovo/shared-widget/commons/commons.dart';
import 'package:iiuovo/shared-widget/commons/translations.dart';
import 'package:iiuovo/shared-widget/cta/blue_cta.dart';
import 'package:iiuovo/shared-widget/styles/text/h2.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _basicFormKey = GlobalKey<FormBuilderState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = getSizeFromContext(context);

    return Scaffold(
      appBar: IiuvoAppBar(
        text: LocaleKeys.login.tr(),
        isLeading: true,
      ),
      body: SafeArea(
        child: FormBuilder(
          key: _basicFormKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: H2(text: LocaleKeys.loginTitle.tr()),
                        ),
                        SizedBox(height: scaleBy(size.height, 0.02)),
                        Text(
                          LocaleKeys.loginMessage.tr(),
                          style: const TextStyle(color: kBlack1, fontSize: 18),
                        ),
                        SizedBox(height: scaleBy(size.height, 0.04)),
                        buildLabel(LocaleKeys.emailLabel.tr()),
                        buildCustomTextField(
                          name: 'emailField',
                          controller: emailTextController,
                          hintText: LocaleKeys.enterEmail.tr(),
                        ),
                        buildLabel(LocaleKeys.passwordLabel.tr()),
                        buildCustomTextField(
                          name: 'passwordField',
                          controller: passwordTextController,
                          hintText: LocaleKeys.enterPassword.tr(),
                          isPasswordType: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle forgot password
                            },
                            child: Text(
                              LocaleKeys.forgotPassword.tr(),
                              style: const TextStyle(color: kBlack1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: BlueCta(
                    text: LocaleKeys.login.tr().toUpperCase(),
                    ctaBorderRadius: BorderRadius.circular(15),
                    onPressedCallback: () {
                      if (_basicFormKey.currentState?.validate() ?? false) {
                        // Handle form submission
                        context.pushNamed('/');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}