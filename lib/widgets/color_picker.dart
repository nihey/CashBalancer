import 'package:flutter/material.dart';

import '../util/tailwind_colors.dart';

class ColorPicker extends StatefulWidget {
  final String initialSelection;
  final ValueChanged<String> onChanged;

  const ColorPicker(this.initialSelection, this.onChanged, {Key? key})
      : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late String selected = widget.initialSelection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            for (String colorName in tailwindColorsNames)
              AnimatedColorItem(
                color: tailwindColors[colorName]![500]!,
                isSelected: colorName == selected,
                onSelected: () {
                  setState(() {
                    selected = colorName;
                  });
                  widget.onChanged(selected);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class AnimatedColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback? onSelected;

  const AnimatedColorItem({
    required this.color,
    required this.isSelected,
    this.onSelected,
    Key? key,
  }) : super(key: key);

  final maxSize = 36.0;

  @override
  Widget build(BuildContext context) {
    final _size = isSelected ? maxSize - 4 : maxSize;

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onSelected,
      child: SizedBox(
        width: 48,
        height: 48,
        child: Stack(
          children: [
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: _size,
                height: _size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
            ),
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: _size - 8,
                height: _size - 8,
                // padding: isSelected ? EdgeInsets.all(4) : EdgeInsets.zero,
                decoration: isSelected
                    ? BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
                      )
                    : BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 0,
                          color: Colors.transparent,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
