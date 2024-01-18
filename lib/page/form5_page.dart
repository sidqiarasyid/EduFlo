import 'package:flutter/material.dart';

import '../code_assets/assets.dart';

class FormPageFifth extends StatelessWidget {
  const FormPageFifth({Key? key}) : super(key: key);

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
              image: DecorationImage(image: AssetsIconImage.bg_form2)),
          child: Center(
            child: Column(
              children: [
                Text(
                  "What's the best way for you to study for a test?",
                  style: StyleText.formText(Colors.white),textAlign: TextAlign.center,
                ),
                SpaceWidget.height(context, 5),
                GestureDetector(
                    child: Container(
                        width:300,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text("Read the book or your notes",style: StyleText.btnForm(Colors.white),)
                    ),onTap:(){
                }
                ),
                SpaceWidget.height(context, 5),
                GestureDetector(
                    child: Container(
                        width:300,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text("Have someone ask you questions that you can answer out loud",style: StyleText.btnForm(Colors.white),)
                    ),onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormPageFifth()));
                }
                ),
                SpaceWidget.height(context, 5),
                GestureDetector(
                    child: Container(
                        width:300,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text("Make up index cards that you can review",style: StyleText.btnForm(Colors.white),)
                    ),onTap:(){

                }
                ),
                GestureDetector(
                    child: Container(
                        width:300,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text("Hands-On Experiments",style: StyleText.btnForm(Colors.white),)
                    ),onTap:(){

                }
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
