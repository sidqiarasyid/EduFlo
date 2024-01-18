import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/local/dummy/style_learning.dart';
import 'package:edu_flo/page/schedule_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinishFinderPage extends StatefulWidget {
  final int option;
  const FinishFinderPage({super.key, required this.option});

  @override
  State<FinishFinderPage> createState() => _FinishFinderPageState();
}

class _FinishFinderPageState extends State<FinishFinderPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SchedulePage()));
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFFFB951),
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              title: Text("EduFLO", style: StyleText.appbarTitle(Colors.black)),
              centerTitle: true),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetsIconImage.bg_finish, fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SpaceWidget.height(context, 0.025),
                  Text("You need to try this learning style",
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  SpaceWidget.height(context, 0.025),
                  Text(
                      widget.option == 1
                          ? "Reading"
                          : widget.option == 2
                              ? "Auditory"
                              : widget.option == 3
                                  ? "Visual"
                                  : "Kinesthetic",
                      style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  SpaceWidget.height(context, 0.025),
                  Text("Here are ways to learn through reading:",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  SpaceWidget.height(context, 0.02),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.option == 1
                        ? Learnstyle.reading.length
                        : widget.option == 2
                            ? Learnstyle.auditory.length
                            : widget.option == 3
                                ? Learnstyle.visual.length
                                : Learnstyle.kinesthetic.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                            widget.option == 1
                                ? Learnstyle.reading[index]
                                : widget.option == 2
                                    ? Learnstyle.auditory[index]
                                    : widget.option == 3
                                        ? Learnstyle.visual[index]
                                        : Learnstyle.kinesthetic[index],
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
