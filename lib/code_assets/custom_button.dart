import 'package:edu_flo/code_assets/assets.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final bool btnGoogle;
  final String txtDefault;
  final VoidCallback onPressed;
  const CustomElevatedButton(
      {Key? key,
      required this.btnGoogle,
      required this.txtDefault,
      required this.onPressed})
      : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return widget.btnGoogle
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(
                    double.infinity, MediaQuery.of(context).size.height * 0.07),
                primary: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
            onPressed: widget.onPressed,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: AssetsIconImage.google,
                ),
                Text("Continue with Google",
                    style: StyleText.button(Colors.black)),
              ],
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(
                    double.infinity, MediaQuery.of(context).size.height * 0.07),
                primary: const Color(0xFF1CC8FF),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
            onPressed: widget.onPressed,
            child:
                Text(widget.txtDefault, style: StyleText.button(Colors.white)),
          );
  }
}
