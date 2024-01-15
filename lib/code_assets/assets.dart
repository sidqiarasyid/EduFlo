import 'package:edu_flo/code_assets/custom_button.dart';
import 'package:edu_flo/code_assets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetsIconImage {
  static SvgPicture iconBack = SvgPicture.asset("assets/icon/icon_back.svg");
  static SvgPicture eyeOff = SvgPicture.asset("assets/icon/eye_off.svg");
  static Image google = Image.asset("assets/images/google.png");
  static Image slide_1 = Image.asset("assets/images/slide_1.png");
  static Image slide_2 = Image.asset("assets/images/slide_2.png");
  static Image slide_3 = Image.asset("assets/images/slide_3.png");
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
      {required String hintText, required bool isPass}) {
    return CustomTextFormsField(isPass: isPass, hintText: hintText);
  }

  static CustomElevatedButton primaryBtn(
      {required String txtDefault, required bool btnGoogle}) {
    return CustomElevatedButton(btnGoogle: btnGoogle, txtDefault: txtDefault);
  }
}
