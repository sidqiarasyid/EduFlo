import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/local/db_helper.dart';
import 'package:edu_flo/model/db/login_db.dart';
import 'package:edu_flo/page/schedule_list.dart';
import 'package:edu_flo/page/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFA5E9FF),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Sign up", style: StyleText.title(null)),
                  SpaceWidget.height(context, 0.03),
                  Text("Let’s begin our journey and step forward",
                      style: StyleText.subtitle(null)),
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
                  SpaceWidget.height(context, 0.05),
                  CustomWidget.primaryBtn(
                      btnGoogle: false,
                      txtDefault: 'Let’s start',
                      onPressed: () async {
                        if (emailController.text.isEmpty &&
                            passController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Email and Password cannot be empty");
                        } else {
                          createAccount(context);
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
                      Text("Already have an account?",
                          style: StyleText.textSpan(null)),
                      SpaceWidget.width(context, 0.02),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()));
                        },
                        child: Text("Sign in",
                            style: StyleText.richText(const Color(0xFF1CADFF))),
                      ),
                    ],
                  )
                ],
              ),
            ),
            isLoad
                ? Container(
                    color: Colors.white.withOpacity(0.5),
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Future createAccount(BuildContext context) async {
    setState(() {
      isLoad = true;
    });
    final account = Login(
        username: "Anonymous",
        email: emailController.text,
        password: passController.text);
    await LoginDatabase.instance.create(account);
    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SchedulePage()));
  }
}
