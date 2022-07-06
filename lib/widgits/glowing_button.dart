import 'package:flutter/material.dart';

class GlowingButton extends StatelessWidget {
  IconData icon;
  Color colour;
  final VoidCallback onPressed;
  double size;
  GlowingButton({
    Key? key,
    required this.icon,
    required this.colour,
    required this.size,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colour,
        boxShadow: [
          BoxShadow(
            color: colour.withOpacity(0.4),
            spreadRadius: 7,
            blurRadius: 24,
            blurStyle: BlurStyle.solid,
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          color: colour,
          child: InkWell(
            onTap: onPressed,
            splashColor: Colors.white,
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
