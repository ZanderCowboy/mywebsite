import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/sections/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

class DetailsVertical extends HookWidget {
  const DetailsVertical({
    required this.initialIndex,
    super.key,
  });

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(
      initialLength: 5,
      initialIndex: initialIndex,
    );
    final index = useState(initialIndex);

    return Card(
      color: kPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBarHeader(
            controller: controller,
            index: index,
            isSmallScreen: context.isSmallScreen,
          ),
          Padding(
            padding: allPadding8,
            child: Builder(
              builder: (context) {
                return switch (controller.index) {
                  0 => const AboutMe(),
                  1 => const Experiences(),
                  2 => const Projects(),
                  3 => const Skills(),
                  4 => const Educations(),
                  _ => const Text('No data available'),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
