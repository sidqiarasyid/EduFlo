import 'package:edu_flo/page/form2_page.dart';
import 'package:flutter/material.dart';

import '../code_assets/assets.dart';

class FormPageFirst extends StatefulWidget {
  const FormPageFirst({Key? key}) : super(key: key);

  @override
  State<FormPageFirst> createState() => _FormPageFirstState();
}

class _FormPageFirstState extends State<FormPageFirst> {
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
                  image: AssetsIconImage.bg_form1, fit: BoxFit.cover)),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SpaceWidget.height(context, 0.1),
                      Text(
                          "Enter your last test score that you want to improve on",
                          style: StyleText.formText(Colors.white),
                          textAlign: TextAlign.center),
                      SpaceWidget.height(context, 0.1),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintStyle:
                                StyleText.subtitle(const Color(0x80000000)),
                            hintText: "........",
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(30),
                          ),
                        ),
                      ),
                      SpaceWidget.height(context, 0.07),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity,
                                MediaQuery.of(context).size.height * 0.07),
                            backgroundColor: const Color(0xFF00B2FF),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FormPageSecond()));
                        },
                        child: Text("Continue",
                            style: StyleText.button(Colors.white)),
                      ),
                    ],
                  ),
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
