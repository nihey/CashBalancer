import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'widgets/color_picker.dart';

void main() => runApp(const StorybookApp());

class StorybookApp extends StatelessWidget {
  const StorybookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story(
            name: 'Animated Color Item',
            builder: (_, k) => ColorPicker('red', (changed) {}),
          ),
        ],
      );
}
