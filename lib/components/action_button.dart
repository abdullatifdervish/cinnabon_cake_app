import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  const ActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -35,
      left: 280,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 78,
          width: 78,
          decoration: BoxDecoration(
            color: Color(0xFF4ABBC9),
            borderRadius: BorderRadius.all(Radius.circular(500)),
          ),
          child: Icon(Icons.arrow_forward_sharp, color: Colors.white),
        ),
      ),
    );
  }
}
