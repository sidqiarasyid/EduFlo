import 'package:edu_flo/page/form5_page.dart';
import 'package:flutter/material.dart';

import '../code_assets/assets.dart';

class FormPageFour extends StatelessWidget {
  const FormPageFour({Key? key}) : super(key: key);

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SpaceWidget.height(context, 0.07),
                      Text(
                        "What kind of book would you like to read for fun?",
                        style: StyleText.formText(Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SpaceWidget.height(context, 0.05),
                      GestureDetector(
                          child: Card(
                            color: Colors.black.withOpacity(0.2),
                            elevation: 25,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                "A book with lots of pictures in it",
                                style: StyleText.btnForm(Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FormPageFifth()));
                          }),
                      SpaceWidget.height(context, 0.03),
                      GestureDetector(
                          child: Card(
                            color: Colors.black.withOpacity(0.2),
                            elevation: 25,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                "A book with lots of words in it",
                                style: StyleText.btnForm(Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FormPageFifth()));
                          }),
                      SpaceWidget.height(context, 0.03),
                      GestureDetector(
                          child: Card(
                            color: Colors.black.withOpacity(0.2),
                            elevation: 25,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                "A book with word searches or crossword puzzles",
                                style: StyleText.btnForm(Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FormPageFifth()));
                          }),
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
