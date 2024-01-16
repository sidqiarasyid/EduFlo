import 'package:edu_flo/code_assets/assets.dart';
import 'package:edu_flo/model/dummy/intro_model.dart';
import 'package:flutter/material.dart';

List<IntroContent> intro = [
  IntroContent(
      colorBg: const Color(0xFF46BCFF),
      image: AssetsIconImage.slide_1,
      title: "Find out your learning method",
      subtitle:
          "Discovering your preferred learning method is crucial for optimizing your educational experience."),
  IntroContent(
      colorBg: const Color(0xFFB3A2F5),
      image: AssetsIconImage.slide_2,
      title: "Organize your task",
      subtitle:
          "Effectively organizing your tasks is key to maximizing productivity and achieving your goals."),
  IntroContent(
      colorBg: const Color(0xFF68DBFF),
      image: AssetsIconImage.slide_3,
      title: "Let’s get started",
      subtitle: "Let's start exploring the exciting journey ahead together.")
];
