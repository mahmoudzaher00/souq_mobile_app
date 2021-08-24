// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "login": "البريد الإلكتروني",
  "this_should_be_translated": "!يجب ترجمة هذا الي اللغة العربية ",
  "enter_email": "الرجاء إدخال البريد الإلكتروني",
  "cannot_less": "!لا يمكن أن يكون البريد الإلكتروني أقل من ثلاثة أحرف",
  "password": "كلمة المرور",
  "enter_password": "الرجاء إدخل كلمة المرور",
  "pass_cannot_less": "!لا يمكن أن تكون كلمة المرور أقل من ستة أرقام",
  "forgot": "نسيت كلمة المرور؟",
  "log": "تسجيل الدخول",
  "Signup": "إنشاء حساب",
  "have_account": "ليس ليدك حساب؟",
  "confirm_password": "تأكيد كلمة المرور ",
  "confirm_enter_password": "الرجاء إدخل كلمة المرور مرة أخري",
  "home": "الرئيسة",
  "Favorites": "المفضلات",
  "more": "المزيد",
  "my_account": "حسابي",
  "Personal_Information": "المعلومات الشخصية",
  "Language": "اللغة",
  "language_control": "التحكم في اللغة",
  "Review_conditions": "راجع الشروط والأحكام",
  "About_app": "حول التطبيق",
  "Get_more": "معرفة المزيد",
  "Terms_and_Conditions": "الشروط والأحكام"
};
static const Map<String,dynamic> en = {
  "login": "Email",
  "this_should_be_translated": "This should be translated to Arabic!",
  "enter_email": "Please Enter Your Email",
  "cannot_less": "Email cannot be less than three characters!",
  "password": "Password",
  "enter_password": "Please Enter Your Password",
  "pass_cannot_less": "The password cannot be less than six digits!",
  "forgot": "Forgot password?",
  "log": "Login",
  "Signup": "Sign up",
  "have_account": "Don't have an account?",
  "confirm_password": "Confirm Password",
  "confirm_enter_password": "Please Enter Your Password ِagain",
  "home": "Home",
  "Favorites": "Favorites",
  "more": "More",
  "my_account": "My Account",
  "Personal_Information": "Personal Information",
  "Language": "Language",
  "language_control": "language control",
  "Review_conditions": "Review the terms and conditions",
  "About_app": "About the app",
  "Get_more": "Get to know us more",
  "Terms_and_Conditions": "Terms and Conditions"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
