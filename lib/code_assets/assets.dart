import 'package:edu_flo/code_assets/custom_button.dart';
import 'package:edu_flo/code_assets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetsIconImage {
  static SvgPicture iconBack = SvgPicture.asset("assets/icon/icon_back.svg");
  static SvgPicture eyeOff = SvgPicture.asset("assets/icon/eye_off.svg");
  static SvgPicture calendar = SvgPicture.asset("assets/icon/calendar.svg");
  static SvgPicture dashboard = SvgPicture.asset("assets/icon/dashboard.svg");
  static SvgPicture home = SvgPicture.asset("assets/icon/home.svg");
  static Image google = Image.asset("assets/images/google.png");
  static Image slide_1 = Image.asset("assets/images/slide_1.png");
  static Image slide_2 = Image.asset("assets/images/slide_2.png");
  static Image slide_3 = Image.asset("assets/images/slide_3.png");
  static Image grade_stat = Image.asset("assets/images/grade_stat.png");
  static Image sched_gen = Image.asset("assets/images/sched_gen.png");
  static Image study_mode = Image.asset("assets/images/study_mode.png");
  static Image style_find = Image.asset("assets/images/style_find.png");
  static Image avatar_user = Image.asset("assets/images/avatar_user.png");
  static Image logo_app = Image.asset("assets/images/logo_app.png");
  static Image study_mode_little =
      Image.asset("assets/images/study_mode_little.png");
  static Image style_find_little =
      Image.asset("assets/images/style_find_little.png");
}

class StyleText {
  static TextStyle title(Color? color) {
    return GoogleFonts.inter(
        fontSize: 36, fontWeight: FontWeight.w700, color: color);
  }

  static TextStyle subtitle(Color? color) {
    return GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w300, color: color);
  }

  static TextStyle calendar(Color? color) {
    return GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w400, color: color);
  }

  static TextStyle button(Color? color) {
    return GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w700, color: color);
  }

  static TextStyle overline(Color? color) {
    return GoogleFonts.inter(
        fontSize: 11, fontWeight: FontWeight.w400, color: color);
  }

  static TextStyle textSpan(Color? color) {
    return GoogleFonts.inter(
        fontSize: 15, fontWeight: FontWeight.w300, color: color);
  }

  static TextStyle richText(Color? color) {
    return GoogleFonts.inter(
        fontSize: 15, fontWeight: FontWeight.w700, color: color);
  }

  static TextStyle dateDay(Color? color) {
    return GoogleFonts.inter(
        fontSize: 15, fontWeight: FontWeight.w600, color: color);
  }

  static TextStyle appbarTitle(Color? color) {
    return GoogleFonts.inter(
        fontSize: 20, fontWeight: FontWeight.w600, color: color);
  }

  static TextStyle email(Color? color) {
    return GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w400, color: color);
  }

  static TextStyle bigText(Color? color) {
    return GoogleFonts.inter(
        fontSize: 50, fontWeight: FontWeight.w600, color: color);
  }

  static TextStyle titleListtile(Color? color) {
    return GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: color);
  }

  static TextStyle subtitleListtile(Color? color) {
    return GoogleFonts.inter(
        fontSize: 10, fontWeight: FontWeight.w400, color: color);
  }

  static TextStyle weekDate(Color? color) {
    return GoogleFonts.inter(
        fontSize: 13, fontWeight: FontWeight.w700, color: color);
  }
}

class SpaceWidget {
  static SizedBox height(BuildContext context, double value) {
    return SizedBox(height: MediaQuery.of(context).size.height * value);
  }

  static SizedBox width(BuildContext context, double value) {
    return SizedBox(width: MediaQuery.of(context).size.width * value);
  }

  static SizedBox widthHeight(
      BuildContext context, double valueHeight, double valueWidth) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * valueWidth,
        height: MediaQuery.of(context).size.height * valueHeight);
  }
}

class CustomWidget {
  static CustomTextFormsField formField(
      {required String hintText,
      required bool isPass,
      TextEditingController? emailController,
      TextEditingController? passController}) {
    return CustomTextFormsField(
      isPass: isPass,
      hintText: hintText,
      emailController: emailController,
      passController: passController,
    );
  }

  static CustomElevatedButton primaryBtn(
      {required String txtDefault,
      required bool btnGoogle,
      required VoidCallback onPressed}) {
    return CustomElevatedButton(
        btnGoogle: btnGoogle, txtDefault: txtDefault, onPressed: onPressed);
  }
}
