import 'package:iiuovo/shared-widget/commons/translations.dart';
import 'package:iiuovo/shared-widget/cta/blue_cta.dart';
import 'package:iiuovo/shared-widget/cta/white_cta.dart';
import 'package:iiuovo/shared-widget/styles/text/h3.dart';

import '../shared-widget/commons/commons.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo/iiuvo-logo.png',
                        width: 140,
                        height: 140,
                      ),
                      H3(text: LocaleKeys.motorTitle.tr())
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: BlueCta(
                          text: LocaleKeys.signUp.tr().toUpperCase(),
                          ctaBorderRadius: BorderRadius.circular(15),
                          onPressedCallback: () {
                            context.pushNamed(signUp);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: WhiteCta(
                          text: LocaleKeys.login.tr().toUpperCase(),
                          onPressedCallback: () {
                            context.pushNamed(login);
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
