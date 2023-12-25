import 'package:flutter/material.dart';
import 'package:flutterzon/src/utils/constants/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final Color color;
  final bool isRectangle;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isRectangle = false,
    this.color = Constants.yellowColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: isRectangle
                ? const BorderRadius.all(Radius.circular(8))
                : const BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(MediaQuery.sizeOf(context).width, 45.0),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
