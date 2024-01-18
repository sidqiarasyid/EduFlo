import 'package:edu_flo/page/form4_page.dart';
import 'package:flutter/material.dart';

import '../code_assets/assets.dart';

class FormPageThird extends StatelessWidget {
  const FormPageThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF6F32FF),
        appBar: AppBar(
            title: Text("EduFLO", style: StyleText.appbarTitle(Colors.black)),
            centerTitle: true),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetsIconImage.bg_form2, fit: BoxFit.cover)),
          child: Center(
            child: Column(
              children: [
                SpaceWidget.height(context, 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "How long do you usually study?",
                    style: StyleText.formText(Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SpaceWidget.height(context, 0.1),
                GestureDetector(
                    child: Container(
                        width: 300,
                        height: 80,
                        padding: const EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetsIconImage.bg_morning,
                              fit: BoxFit.cover),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "> 2 Hours",
                            style: StyleText.btnForm(Colors.white),
                          ),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormPageFour()));
                    }),
                SpaceWidget.height(context, 0.05),
                GestureDetector(
                    child: Container(
                        width: 300,
                        height: 80,
                        padding: const EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetsIconImage.bg_night,
                              fit: BoxFit.cover),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "1-2 Hours",
                            style: StyleText.btnForm(Colors.white),
                          ),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormPageFour()));
                    }),
                SpaceWidget.height(context, 0.05),
                GestureDetector(
                    child: Container(
                        width: 300,
                        height: 80,
                        padding: const EdgeInsets.only(left: 25),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetsIconImage.bg_moon,
                              fit: BoxFit.cover),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "< 1 Hour",
                            style: StyleText.btnForm(Colors.white),
                          ),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormPageFour()));
                    }),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
