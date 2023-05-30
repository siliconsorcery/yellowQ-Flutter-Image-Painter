import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, this.onTap, this.isSelected, this.color}) : super(key: key);
  final VoidCallback? onTap;
  final bool? isSelected;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: isSelected! ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected! ? Colors.black.withAlpha(192) : Colors.black.withAlpha(32),
            width: isSelected! ? 2 : 1,
          ),
        ),
        child: CircleAvatar(radius: isSelected! ? 12 : 13, backgroundColor: color),
      ),
    );
  }
}

const List<Color> editorColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.black,
  Colors.grey,
  Colors.white,
];
