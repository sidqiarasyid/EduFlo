import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/page/schedule_list.dart';
import 'package:edu_flo/page/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFA5E9FF),
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign In", style: StyleText.title(null)),
              SpaceWidget.height(context, 0.03),
              Text(
                  "Let’s continue your recent progress and make it better then before",
                  style: StyleText.subtitle(null),
                  textAlign: TextAlign.center),
              SpaceWidget.height(context, 0.03),
              CustomWidget.formField(
                  hintText: 'Email',
                  isPass: false,
                  emailController: emailController),
              SpaceWidget.height(context, 0.02),
              CustomWidget.formField(
                  hintText: 'Password',
                  isPass: true,
                  passController: passController),
              SpaceWidget.height(context, 0.01),
              Row(
                children: [
                  Expanded(child: Container()),
                  Text("Reset Password", style: StyleText.overline(null)),
                ],
              ),
              SpaceWidget.height(context, 0.05),
              CustomWidget.primaryBtn(
                  btnGoogle: false,
                  txtDefault: 'Sign In',
                  onPressed: () {
                    if (emailController.text.isEmpty &&
                        passController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Email and Password cannot be empty");
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SchedulePage()));
                    }
                  }),
              SpaceWidget.height(context, 0.05),
              Row(
                children: [
                  const Expanded(child: Divider(color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Or continue with",
                        style: StyleText.subtitle(null)),
                  ),
                  const Expanded(child: Divider(color: Colors.black)),
                ],
              ),
              SpaceWidget.height(context, 0.05),
              CustomWidget.primaryBtn(
                  btnGoogle: true, txtDefault: '', onPressed: () {}),
              SpaceWidget.height(context, 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?",
                      style: StyleText.textSpan(null)),
                  SpaceWidget.width(context, 0.02),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: Text("Sign up",
                        style: StyleText.richText(const Color(0xFF1CADFF))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
