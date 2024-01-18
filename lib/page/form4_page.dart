import 'package:edu_flo/page/form5_page.dart';
import 'package:flutter/material.dart';

import '../code_assets/assets.dart';


class FormPageFour extends StatelessWidget {
  const FormPageFour({Key? key}) : super(key: key);

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
                  "What kind of book would you like to read for fun?",
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
                        child: Text("A book with lots of pictures in it",style: StyleText.btnForm(Colors.white),)
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
                        child: Text("A book with lots of words in it",style: StyleText.btnForm(Colors.white),)
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
                        child: Text("A book with word searches or crossword puzzles",style: StyleText.btnForm(Colors.white),)
                    ),onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormPageFifth()));
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
