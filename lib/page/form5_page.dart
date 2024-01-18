import 'package:edu_flo/page/finish_find.dart';
import 'package:flutter/material.dart';

import '../code_assets/assets.dart';

class FormPageFifth extends StatelessWidget {
  const FormPageFifth({Key? key}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceWidget.height(context, 0.07),
                    Text(
                      "What's the best way for you to study for a test?",
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
                              "Read the book or your notes",
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
                                      const FinishFinderPage(option: 1)));
                        }),
                    SpaceWidget.height(context, 0.03),
                    GestureDetector(
                        child: Card(
                          color: Colors.black.withOpacity(0.2),
                          elevation: 25,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Have someone ask you questions that you can answer out loud",
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
                                      const FinishFinderPage(option: 2)));
                        }),
                    SpaceWidget.height(context, 0.03),
                    GestureDetector(
                        child: Card(
                          color: Colors.black.withOpacity(0.2),
                          elevation: 25,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Make up index cards that you can review",
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
                                      const FinishFinderPage(option: 3)));
                        }),
                    SpaceWidget.height(context, 0.03),
                    GestureDetector(
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.black.withOpacity(0.1),
                            elevation: 12,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                "Hands-On Experiments",
                                style: StyleText.btnForm(Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FinishFinderPage(option: 4)));
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
    );
  }
}
