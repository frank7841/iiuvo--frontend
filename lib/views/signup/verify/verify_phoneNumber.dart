import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iiuovo/shared-widget/appbar/iiuvo_app_bar.dart';
import 'package:iiuovo/shared-widget/commons/commons.dart';
import 'package:iiuovo/shared-widget/commons/translations.dart';
import 'package:iiuovo/shared-widget/cta/blue_cta.dart';
import 'package:iiuovo/shared-widget/styles/text/h2.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final _basicFormKey = GlobalKey<FormBuilderState>();
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < _otpControllers.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String get _otpCode => _otpControllers.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    final Size size = getSizeFromContext(context);

    return Scaffold(
      appBar: IiuvoAppBar(
        text: LocaleKeys.otpPhone.tr(),
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
                Align(
                  alignment: Alignment.topCenter,
                  child: H2(text: LocaleKeys.pleaseEnterOtp.tr()),
                ),
                SizedBox(height: scaleBy(size.height, 0.02)),
                Text(
                  LocaleKeys.otpMessage.tr(),
                  style: const TextStyle(color: kBlack1, fontSize: 18),
                ),
                SizedBox(height: scaleBy(size.height, 0.05)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: TextField(
                          controller: _otpControllers[index],
                          focusNode: _focusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          cursorColor: kBlack1,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: kBlack1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kBlack1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kBlack1),
                            ),
                          ),
                          onChanged: (value) => _onChanged(index, value),
                        ),
                      ),
                    );
                  }),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: BlueCta(
                    text: LocaleKeys.verifyOtp.tr().toUpperCase(),
                    onPressedCallback: () {
                      if (_otpCode.length == 4) {
                        context.pushNamed(login);
                        // Verify OTP
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
