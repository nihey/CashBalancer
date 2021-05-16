import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'details_screen/pickers.dart';

void main() => runApp(const StorybookApp());

class StorybookApp extends StatelessWidget {
  const StorybookApp();

  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story(
            name: 'Animated Color Item',
            builder: (_, k) => AnimatedColorPicker('red', (changed) {}),
          ),
        ],
      );
}