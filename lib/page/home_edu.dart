import 'package:edu_flo/code_assets/assets.dart';
import 'package:flutter/material.dart';

class HomeEduFlo extends StatefulWidget {
  const HomeEduFlo({super.key});

  @override
  State<HomeEduFlo> createState() => _HomeEduFloState();
}

class _HomeEduFloState extends State<HomeEduFlo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
            title: Text("EduFLO", style: StyleText.appbarTitle(Colors.black)),
            centerTitle: true),
        body: Center(
          child: Column(
            children: [
              SpaceWidget.height(context, 0.05),
              GestureDetector(
                onTap: () {},
                child: AssetsIconImage.study_mode,
              ),
              SpaceWidget.height(context, 0.03),
              GestureDetector(
                onTap: () {},
                child: AssetsIconImage.grade_stat,
              ),
              SpaceWidget.height(context, 0.03),
              GestureDetector(
                onTap: () {},
                child: AssetsIconImage.sched_gen,
              ),
              SpaceWidget.height(context, 0.03),
              GestureDetector(
                onTap: () {},
                child: AssetsIconImage.style_find,
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
