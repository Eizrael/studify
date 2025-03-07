import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  final IconData iconName;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomIconBtn({
    super.key,
    required this.iconName,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.pink[200],
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Icon(
          iconName,
          color: isSelected ? Colors.white : Colors.black,
          size: 28,
        ),
      ),
    );
  }
}
