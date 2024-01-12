import 'package:edu_flo/code_assets/assets.dart';
import 'package:flutter/material.dart';

class CustomTextFormsField extends StatefulWidget {
  final String hintText;
  final bool isPass;
  const CustomTextFormsField(
      {Key? key, required this.hintText, required this.isPass})
      : super(key: key);

  @override
  State<CustomTextFormsField> createState() => _CustomTextFormsFieldState();
}

class _CustomTextFormsFieldState extends State<CustomTextFormsField> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return widget.isPass
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              obscureText: !showPass,
              decoration: InputDecoration(
                hintStyle: StyleText.subtitle(const Color(0x80000000)),
                hintText: 'Password',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(20),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: Icon(
                      showPass ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0x80000000),
                    ),
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                  ),
                ),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintStyle: StyleText.subtitle(const Color(0x80000000)),
                hintText: widget.hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
          );
  }
}
