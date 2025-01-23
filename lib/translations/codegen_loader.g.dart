// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "motorTitle": "By MotorVault",
  "iiuovoTitle": "IIUOVO",
  "signUp": "Sign Up",
  "login": "Login",
  "welcomeTitle": "Hi, Welcome to Iiuvo",
  "signupTitle": "Sign up to create your brand new account",
  "enterEmail": "Enter your email",
  "enterPhone": "Enter your phone number",
  "enterPassword": "Enter your password",
  "confirmPassword": "Confirm your password",
  "enterFullName": "Enter your Full name",
  "emailLabel": "Email address",
  "passwordLabel": "Password",
  "confirmPasswordLabel": "Confirm password",
  "fullNameLabel": "Full name",
  "phoneLabel": "Phone number",
  "termsAndConditions": "By signing up you agree to Motorvault’s Terms of Service and Privacy Policy",
  "otpPhone": "Verify your identity",
  "pleaseEnterOtp": "Enter the code we have sent to your phone",
  "otpMessage": "This helps us keep your account secure by verifying that it's really you",
  "verifyOtp": "Verify OTP"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
