import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/local/dummy/intro_list.dart';
import 'package:edu_flo/model/dummy/intro_model.dart';
import 'package:flutter/material.dart';

class IntroBuilder extends StatefulWidget {
  final IntroContent introContent;
  const IntroBuilder({super.key, required this.introContent});

  @override
  State<IntroBuilder> createState() => _IntroBuilderState();
}

class _IntroBuilderState extends State<IntroBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.introContent.image,
          Text(widget.introContent.title,
              style: StyleText.title(Colors.black),
              textAlign: TextAlign.center),
          SpaceWidget.height(context, 0.02),
          Text(widget.introContent.subtitle,
              style: StyleText.subtitle(Colors.black),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
