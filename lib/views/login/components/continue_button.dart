import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;

  const ContinueButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor,
        minimumSize: Size(double.infinity, 60),
      ),
      child: Text('Continue'),
    );
  }
}
