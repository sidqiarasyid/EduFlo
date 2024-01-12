import 'package:edu_flo/code_assets/assets.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA5E9FF),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign up", style: StyleText.title(null)),
              SpaceWidget.height(context, 0.03),
              Text("Let’s begin our journey and step forward",
                  style: StyleText.subtitle(null)),
              SpaceWidget.height(context, 0.03),
              CustomWidget.formField(hintText: 'Email', isPass: false),
              SpaceWidget.height(context, 0.02),
              CustomWidget.formField(hintText: 'Password', isPass: true),
            ],
          ),
        ),
      ),
    );
  }
}
