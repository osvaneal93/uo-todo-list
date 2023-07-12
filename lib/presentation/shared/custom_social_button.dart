import 'package:flutter/material.dart';
import 'package:todo_note_app/presentation/shared/custom_shop_elevated_button.dart';

class CustomSocialButton extends StatefulWidget {
  final ButtonSize? buttonSize;
  final String label, imagePath;
  final void Function()? onPressed;
  final Color color;
  const CustomSocialButton(
      {super.key,
      this.buttonSize,
      this.label = 'Button',
      this.onPressed,
      required this.color,
      required this.imagePath});

  @override
  CustomShopElevatedButtonState createState() => CustomShopElevatedButtonState();
}

class CustomShopElevatedButtonState extends State<CustomSocialButton> {
  // Color _buttonColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.buttonSize?.getSize(MediaQuery.of(context).size),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          side: const BorderSide(
            width: 2.0,
            color: Color(0xff8875FF),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        ),
        onPressed: widget.onPressed, // Llamar a la función _changeColor cuando se presione el botón
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.imagePath, height: 20),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
