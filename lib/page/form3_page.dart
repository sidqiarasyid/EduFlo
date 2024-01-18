import 'package:edu_flo/page/form4_page.dart';
import 'package:flutter/material.dart';

import '../code_assets/assets.dart';

class FormPageThird extends StatelessWidget {
  const FormPageThird({Key? key}) : super(key: key);

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
                  "How long do you usually study?",
                  style: StyleText.formText(Colors.white),textAlign: TextAlign.center,
                ),
                SpaceWidget.height(context, 5),
                GestureDetector(
                    child: Container(
                        width:300,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetsIconImage.bg_morning,
                              fit: BoxFit.cover
                          ),
                        ),
                        child: Text("> 2 Hours",style: StyleText.btnForm(Colors.white),)
                    ),onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormPageFour()));
                }
                ),
                SpaceWidget.height(context, 5),
                GestureDetector(
                    child: Container(
                        width:300,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetsIconImage.bg_night,
                              fit: BoxFit.cover
                          ),
                        ),
                        child: Text("1-2 Hours",style: StyleText.btnForm(Colors.white),)
                    ),onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormPageFour()));
                }
                ),
                SpaceWidget.height(context, 5),
                GestureDetector(
                    child: Container(
                        width:300,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetsIconImage.bg_moon,
                              fit: BoxFit.cover
                          ),
                        ),
                        child: Text("< 1 Hour",style: StyleText.btnForm(Colors.white),)
                    ),onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormPageFour()));
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
