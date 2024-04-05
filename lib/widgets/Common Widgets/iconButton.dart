import 'package:flutter/material.dart';

class ResizableRoundedIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double iconSize;
  final double buttonSize;
  final double borderRadius;
  final Color color;

  const ResizableRoundedIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.iconSize,
    required this.buttonSize,
    required this.borderRadius,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
          size: iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
