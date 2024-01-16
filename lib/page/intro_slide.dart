import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/code_assets/intro_builder.dart';
import 'package:edu_flo/local/dummy/intro_list.dart';
import 'package:edu_flo/model/dummy/intro_model.dart';
import 'package:edu_flo/page/sign_in.dart';
import 'package:edu_flo/page/sign_up.dart';
import 'package:flutter/material.dart';

class IntroSlidePage extends StatefulWidget {
  const IntroSlidePage({super.key});

  @override
  State<IntroSlidePage> createState() => _IntroSlidePageState();
}

class _IntroSlidePageState extends State<IntroSlidePage> {
  int currentIndex = 0;
  PageController? controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentIndex == 0
            ? const Color(0xFF46BCFF)
            : currentIndex == 1
                ? const Color(0xFFB3A2F5)
                : const Color(0xFF68DBFF),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(500))),
              ),
            ),
            Column(
              children: [
                header(),
                content(),
                bottom(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                intro.length, (index) => buildDot(context, index)),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () {
                controller!.animateToPage(2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
              child: Text("Skip",
                  style: StyleText.subtitle(Colors.white),
                  textAlign: TextAlign.end),
            ),
          )),
        ],
      ),
    );
  }

  Widget buildDot(BuildContext context, int index) {
    return Container(
      height: 8,
      width: 25,
      decoration: BoxDecoration(
          borderRadius: index == 0
              ? const BorderRadius.horizontal(left: Radius.circular(50))
              : index == 2
                  ? const BorderRadius.horizontal(right: Radius.circular(50))
                  : BorderRadius.zero,
          color: currentIndex == index
              ? Colors.white
              : Colors.white.withOpacity(0.5)),
    );
  }

  Widget content() {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: intro.length,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return IntroBuilder(introContent: intro[index]);
        },
      ),
    );
  }

  Widget bottom() {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: currentIndex != 2
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1CC8FF),
                  textStyle: StyleText.button(null),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(500)))),
              onPressed: () {
                controller!.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 23),
                child:
                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity,
                            MediaQuery.of(context).size.height * 0.07),
                        backgroundColor: const Color(0xFF1CC8FF),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: Text("I’m new here",
                        style: StyleText.button(Colors.white)),
                  ),
                  SpaceWidget.height(context, 0.02),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(double.infinity,
                            MediaQuery.of(context).size.height * 0.07),
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                    child:
                        Text("Sign In", style: StyleText.button(Colors.black)),
                  ),
                ],
              ),
            ),
    );
  }
}
