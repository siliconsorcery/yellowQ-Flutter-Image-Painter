import 'package:flutter/material.dart';

import '../../image_painter.dart';

class SelectionItems extends StatelessWidget {
  final bool? isSelected;
  final ModeData? data;
  final VoidCallback? onTap;

  const SelectionItems({Key? key, this.isSelected, this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: isSelected! ? Colors.blue : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              children: [
                IconTheme(
                  data: const IconThemeData(opacity: 1.0),
                  child: Icon(
                    data!.icon,
                    color: isSelected! ? Colors.white : Colors.blue,
                    size: 16.0,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  data!.label!,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: isSelected! ? Colors.white : Theme.of(context).textTheme.bodyLarge!.color),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<ModeData> paintModes(TextDelegate textDelegate) => [
      ModeData(icon: Icons.zoom_out_map, mode: PaintMode.none, label: textDelegate.noneZoom),
      ModeData(icon: Icons.horizontal_rule, mode: PaintMode.line, label: textDelegate.line),
      ModeData(icon: Icons.crop_free, mode: PaintMode.rect, label: textDelegate.rectangle),
      ModeData(icon: Icons.edit, mode: PaintMode.freeStyle, label: textDelegate.drawing),
      ModeData(icon: Icons.lens_outlined, mode: PaintMode.circle, label: textDelegate.circle),
      ModeData(icon: Icons.arrow_right_alt_outlined, mode: PaintMode.arrow, label: textDelegate.arrow),
      ModeData(icon: Icons.power_input, mode: PaintMode.dashLine, label: textDelegate.dashLine),
      ModeData(icon: Icons.text_format, mode: PaintMode.text, label: textDelegate.text),
    ];

@immutable
class ModeData {
  final IconData? icon;
  final PaintMode? mode;
  final String? label;
  const ModeData({
    this.icon,
    this.mode,
    this.label,
  });
}
