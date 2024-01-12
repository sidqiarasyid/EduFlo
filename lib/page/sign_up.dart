import 'package:edu_flo/code_assets/assets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA5E9FF),
      extendBodyBehindAppBar: true,
      body: Padding(
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
            CustomWidget.formField(hintText: 'Email', isPass: false),
            SpaceWidget.height(context, 0.02),
            CustomWidget.formField(hintText: 'Password', isPass: true),
            SpaceWidget.height(context, 0.05),
            CustomWidget.primaryBtn(
                btnGoogle: false, txtDefault: 'Let’s start'),
            SpaceWidget.height(context, 0.05),
            Row(
              children: [
                const Expanded(child: Divider(color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child:
                      Text("Or continue with", style: StyleText.subtitle(null)),
                ),
                const Expanded(child: Divider(color: Colors.black)),
              ],
            ),
            SpaceWidget.height(context, 0.05),
            CustomWidget.primaryBtn(btnGoogle: true, txtDefault: ''),
            SpaceWidget.height(context, 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: StyleText.textSpan(null)),
                SpaceWidget.width(context, 0.02),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Sign in",
                      style: StyleText.richText(const Color(0xFF1CADFF))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
