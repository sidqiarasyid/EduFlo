import 'package:edu_flo/page/form2_page.dart';
import 'package:flutter/material.dart';

import '../code_assets/assets.dart';

class FormPageFirst extends StatelessWidget {
  const FormPageFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
            title: Text("EduFLO", style: StyleText.appbarTitle(Colors.black)),
            centerTitle: true),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetsIconImage.bg_form1)),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Enter your last test score that you want to improve on",
                  style: StyleText.formText(Colors.white), textAlign: TextAlign.center
                ),
                SpaceWidget.height(context, 11),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintStyle: StyleText.subtitle(const Color(0x80000000)),
                      hintText: "........",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(30),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity,
                          MediaQuery.of(context).size.height * 0.05),
                      primary: const Color(0xFF00B2FF),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormPageSecond()));
                  },
                  child:
                      Text("Continue", style: StyleText.button(Colors.white)),
                ),
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
